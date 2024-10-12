require_relative "../../template"
require 'tomlib'
require 'set'

OUTPUT_PATH = File.expand_path(File.join(File.dirname(__FILE__), 'output'))
TARGET_PATH = File.expand_path(File.join(OUTPUT_PATH, 'vlcb_defs.h'))

def generate_c(spec)
  FileUtils.mkdir_p(OUTPUT_PATH) unless Dir.exist?(OUTPUT_PATH)

  puts "Generating C files"
  update_generated_files(spec)
  puts "Formatting files"
  format_files()
  puts "Done"
end

def format_files()
  system("clang-format #{TARGET_PATH} > #{TARGET_PATH}.tmp && mv #{TARGET_PATH}.tmp #{TARGET_PATH}")
end

def update_generated_files(spec)
  renderer = Renderer.new(File.join(File.dirname(__FILE__), 'templates'))
  ctx = { body: "#pragma once\n\n", meta: nil }

  for spec_item in spec[:spec]
    ctx[:meta] = spec[:meta]
    if spec_item[:meta]
      ctx[:meta] = spec_item[:meta].merge(ctx[:meta])
    end

    case spec_item[:type]
    when "Enum"
      ctx = gen_enum(ctx, renderer, spec_item)
    when "Flags"
      ctx = gen_flags(ctx, renderer, spec_item)
    else
      raise "Unimplemented codegen spec item type #{spec_item[:type]}"
    end
  end

  File.write(TARGET_PATH, ctx[:body])
end

def gen_enum(ctx, renderer, enum)
  enum_meta = enum[:meta] ? enum[:meta].merge(ctx[:meta]) : ctx[:meta]
  ctx[:meta] = enum_meta

  if ctx[:meta] && ctx[:meta][:'clang-type-prefix']
    enum[:identifier] = ctx[:meta][:'clang-type-prefix'] + enum[:identifier]
  end

  enum[:comments] = parse_comments(enum[:comments])
  enum[:body].each do |variant|
    ctx[:meta] = enum_meta
    if variant['meta']
      ctx[:meta] = variant['meta'].merge(ctx[:meta])
    end

    id = variant['identifier']
    if ctx[:meta] && ctx[:meta][:'dont-split-enum-var'] === true
      id = id.upcase
    else
      id = camel_to_upper_snake(id)
    end
    if ctx[:meta] && ctx[:meta][:'clang-enum-var-prefix']
      id = ctx[:meta][:'clang-enum-var-prefix'] + id
    end
    variant['identifier'] = id

    variant['comments'] = parse_comments(variant['comments'])

    #TODO: implement rendering doc markdown files into comments
    # if variant['commentsFrom']
    #   variant['annotations'] = [
    #     "doc  = include_str!(\"../#{variant['commentsFrom']}\")"
    #   ]
    # end
  end

  #TODO: implement rendering doc markdown files into comments
  # if ctx[:commentsFrom]
  #   flags[:annotations].append("doc  = include_str!(\"../#{ctx[:commentsFrom]}\")")
  # end

  output = renderer.r('enum', enum: enum)
  ctx[:body] = "#{ctx[:body]}#{output}"

  return ctx
end

def gen_flags(ctx, renderer, flags)
  flags_meta = flags[:meta] ? flags[:meta].merge(ctx[:meta]) : ctx[:meta]
  ctx[:meta] = flags_meta

  if ctx[:meta] && ctx[:meta][:'clang-type-prefix']
    flags[:identifier] = ctx[:meta][:'clang-type-prefix'] + flags[:identifier]
  end

  flags[:comments] = parse_comments(flags[:comments])
  flags[:body].each do |flag|
    ctx[:meta] = flags_meta
    if flag['meta']
      ctx[:meta] = flag['meta'].merge(ctx[:meta])
    end

    flag['comments'] = parse_comments(flag['comments'])

    id = flag['identifier']
    if ctx[:meta] && ctx[:meta][:'dont-split-enum-var'] === true
      id = id.upcase
    else
      id = camel_to_upper_snake(id)
    end
    if ctx[:meta] && ctx[:meta][:'clang-enum-var-prefix']
      id = ctx[:meta][:'clang-enum-var-prefix'] + id
    end
    flag['identifier'] = id

    #TODO: implement rendering doc markdown files into comments
    # if flag['commentsFrom']
    #   flag['annotations'] = [
    #     "doc  = include_str!(\"../#{flag['commentsFrom']}\")"
    #   ]
    # end
  end

  #TODO: implement rendering doc markdown files into comments
  # if ctx[:commentsFrom]
  #   flags[:annotations].append("doc  = include_str!(\"../#{ctx[:commentsFrom]}\")")
  # end

  output = renderer.r('flags', flags: flags)
  ctx[:body] = "#{ctx[:body]}#{output}"

  return ctx
end

def parse_comments(comments)
  return comments.is_a?(String) ? comments.split("\n") : []
end

def camel_to_upper_snake(str)
  if str.is_a?(String)
    str.gsub(/([a-z])([A-Z])/, '\1_\2').upcase
  else
    raise "Input '#{str}' is not a string"
  end
end
