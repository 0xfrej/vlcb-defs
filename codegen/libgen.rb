require_relative 'schema'
require_relative 'lang/c/generator'
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: script.rb [options]"

  opts.on("-l", "--lang LANGUAGE", "Specify the language") do |lang|
    options[:lang] = lang
  end
end.parse!

def run_language_function(lang)
  file_path = './definition.yaml'
  begin
      spec = load_and_validate_yaml(file_path)
      puts "Validation passed"
  rescue ArgumentError => e
      raise "Validation failed: #{e.message}"
  end

  case lang.downcase
  when 'rust'
    generate_rust(spec)
  when 'c'
    generate_c(spec)
  else
    puts "Unsupported language, available options: c, rust"
  end
end

if options[:lang]
  run_language_function(options[:lang])
else
  puts "Please specify a language using -l or --lang option."
end
