require_relative "../../template"
require 'set'

TEMPLATE_PATH = File.expand_path(File.join(File.dirname(__FILE__), 'templates/imports.erb'))
OUTPUT_PATH = File.expand_path(File.join(File.dirname(__FILE__), 'output'))
FORMATTER_PATH = File.expand_path(File.join(File.dirname(__FILE__), 'formatter'))
TARGET_PATH = File.expand_path(File.join(OUTPUT_PATH, 'vlcb_rs.rs'))

def generate_rust(spec)
  FileUtils.mkdir_p(OUTPUT_PATH) unless Dir.exist?(OUTPUT_PATH)

  puts "Generating Rust files"
  update_generated_files(spec)
  puts "Running formatter"
  format_files()
  puts "Done"
end

def format_files()
  %x[cd #{FORMATTER_PATH} && cargo run formatter]
end

def update_generated_files(spec)
  renderer = Renderer.new(File.join(File.dirname(__FILE__), 'templates'))
  ctx = { imports: Set.new, body: "" }

  for spec_item in spec[:spec]
    case spec_item[:type]
    when "Enum"
      ctx = gen_enum(ctx, renderer, spec_item)
    when "Flags"
      ctx = gen_flags(ctx, renderer, spec_item)
    else
      raise "Unimplemented codegen spec item type #{spec_item[:type]}"
    end
  end

  ctx = gen_imports(ctx, renderer)

  File.write(TARGET_PATH, ctx[:body])
  system('rustfmt', TARGET_PATH)
end

def gen_imports(ctx, renderer)
  output = renderer.r('imports', imports: ctx[:imports])
  ctx[:body] = "#{output}#{ctx[:body]}"
  return ctx
end

def gen_enum(ctx, renderer, enum)
  ctx[:imports].add('num_enum::IntoPrimitive')
  ctx[:imports].add('num_enum::TryFromPrimitive')
  ctx[:imports].add('num_enum::UnsafeFromPrimitive')

  extra_derives = Set.new

  enum[:comments] = parse_comments(enum[:comments])
  enum[:body].each do |variant|
    variant['comments'] = parse_comments(variant['comments'])

    if variant['commentsFrom']
      variant['annotations'] = [
        "doc  = include_str!(\"../#{variant['commentsFrom']}\")"
      ]
    end

    if variant['is_default'] == true
      ctx[:imports].add('num_enum::FromPrimitive')
      extra_derives.add('FromPrimitive')
    end
  end

  enum[:annotations] = [
    "derive(Debug, Copy, Clone, UnsafeFromPrimitive, IntoPrimitive, Eq, PartialEq, #{"TryFromPrimitive" if extra_derives.empty?}#{extra_derives.join(', ')})",
    'cfg_attr(feature = "defmt", derive(defmt::Format))',
    "repr(#{enum[:data_type]})",
  ]

  if ctx[:commentsFrom]
    flags[:annotations].append("doc  = include_str!(\"../#{ctx[:commentsFrom]}\")")
  end

  output = renderer.r('enum', enum: enum)
  ctx[:body] = "#{output}#{ctx[:body]}"

  return ctx
end

def gen_flags(ctx, renderer, flags)
  ctx[:imports].add('bitflags::bitflags')

  flags[:data_type_size] = flags[:data_type][1..-1]

  flags[:comments] = parse_comments(flags[:comments])
  flags[:body].each do |flag|
    flag['comments'] = parse_comments(flag['comments'])

    if flag['commentsFrom']
      flag['annotations'] = [
        "doc  = include_str!(\"../#{flag['commentsFrom']}\")"
      ]
    end
  end

  flags[:annotations] = [
    'derive(Debug, Copy, Clone)'
  ]

  if ctx[:commentsFrom]
    flags[:annotations].append("doc  = include_str!(\"../#{ctx[:commentsFrom]}\")")
  end

  output = renderer.r('flags', flags: flags)
  ctx[:body] = "#{output}#{ctx[:body]}"

  return ctx
end

def parse_comments(comments)
  return comments.is_a?(String) ? comments.split("\n") : []
end
