require 'yaml'
require 'dry-validation'
require 'dry-types'
require 'semverse'
require 'pathname'
require 'psych'

def include_file(node)
  filename = node.value
  YAML.load_file(filename)
end

module Types
  include Dry.Types()

  BoolWithDefaultFalse = Types::Bool.default(false)
end

module ValueCanBeIntegerOrChar
  def self.included(base)
    base.class_eval do
      rule(:value, :data_type) do
        if values[:data_type].start_with?('u')
          key.failure('must be a positive integer') unless values[:value].is_a?(Integer) && values[:value] >= 0
        elsif values[:data_type].start_with?('i')
          key.failure('must be an integer') unless values[:value].is_a?(Integer)
        elsif values[:data_type] == 'char'
          key.failure('must be a single character') unless values[:value].is_a?(String) && values[:value].length == 1
        end
      end
    end
  end
end

class CodegenMetaSchema < Dry::Validation::Contract
  params do
    optional(:'clang-type-prefix').maybe(Types::String)
    optional(:'clang-enum-var-prefix').maybe(Types::String)
    optional(:'dont-split-enum-var').maybe(Types::BoolWithDefaultFalse)
  end

  def merge(parent = nil)
    clone = parent.nil? ? self.dup : parent.dup
    if parent
      self.to_h.each do |key, value|
        clone[key] = value
      end
    end
    clone
  end
end

class FlagsBodySchema < Dry::Validation::Contract
  params do
    optional(:meta).maybe(CodegenMetaSchema.schema)
    required(:identifier).filled(Types::String)
    required(:value).filled(Types::Integer)
    optional(:comments).maybe(Types::String)
    optional(:commentsFrom).maybe(Types::String)
  end

  rule(:identifier) do
    key.failure('cannot start with a numeric character') if value =~ /^\d/
  end

  rule(:commentsFrom) do
    if key && value
      script_path = Pathname.new(__dir__).join('../')
      file_path = script_path.join(value)

      unless file_path.file?
        key.failure("must be a valid path and point to an existing file")
      end
    end
  end
end

class EnumBodySchema < Dry::Validation::Contract
  include ValueCanBeIntegerOrChar

  params do
    optional(:meta).maybe(CodegenMetaSchema.schema)
    required(:identifier).filled(Types::String)
    required(:value).filled(Types::Any)
    optional(:is_default).maybe(Types::BoolWithDefaultFalse)
    optional(:comments).maybe(Types::String)
    optional(:commentsFrom).maybe(Types::String)
  end

  rule(:identifier) do
    key.failure('cannot start with a numeric character') if value =~ /^\d/
  end

  rule(:commentsFrom) do
    if key && value
      script_path = Pathname.new(__dir__).join('../')
      file_path = script_path.join(value)

      unless file_path.file?
        key.failure("must be a valid path and point to an existing file")
      end
    end
  end
end

class CodegenSpecSchema < Dry::Validation::Contract
  params do
    optional(:meta).maybe(CodegenMetaSchema.schema)
    required(:type).filled(Types::String)
    optional(:data_type).maybe(Types::String)
    required(:identifier).filled(Types::String)
    optional(:comments).maybe(Types::String)
    optional(:commentsFrom).maybe(Types::String)
    optional(:body).array(:hash)
  end

  rule(:identifier) do
    key.failure('cannot start with a numeric character') if value =~ /^\d/
  end

  rule(:type) do
    unless %w[Enum Flags].include?(value)
      key.failure('must be either Enum or Flags')
    end
  end

    rule(:data_type, :type) do
  if %w[Enum Flags].include?(values[:type])
    key.failure('must be present') if values[:data_type].nil?
      if values[:type] == "Enum" && values[:data_type] && !%w[u8 u16 u32 u64 i8 i16 i32 i64 char].include?(values[:data_type])
        key.failure('must be one of: u8, u16, u32, u64, i8, i16, i32, i64, char')
      elsif values[:type] == "Flags" && values[:data_type] && !%w[u8 u16 u32 u64].include?(values[:data_type])
        key.failure('must be one of: u8, u16, u32, u64')
      end
    end
  end

  rule(:body, :type) do
    next unless values[:body]

    body_schema = values[:type] == 'Enum' ? EnumBodySchema.new : FlagsBodySchema.new
    values[:body].each_with_index do |body_item, index|
      body_item[:data_type] = values[:data_type]
      result = body_schema.call(body_item)
      unless result.success?
        result.errors.to_h.each do |field, errors|
          key([:body, index, field]).failure(errors.join(', '))
        end
      end
    end
  end

  rule(:commentsFrom) do
    if key && value
      script_path = Pathname.new(__dir__).join('../')
      file_path = script_path.join(value)

      unless file_path.file?
        key.failure("must be a valid path and point to an existing file")
      end
    end
  end
end

class CodegenSchema < Dry::Validation::Contract
  params do
    optional(:meta).maybe(CodegenMetaSchema.schema)
    required(:spec).array(CodegenSpecSchema.schema)
  end
end

def load_and_validate_yaml(file_path)
  YAML.add_domain_type('', 'include') do |type, val|
    include_file(Psych::Nodes::Scalar.new(val))
  end

  data = YAML.load_file(file_path)
  schema = CodegenSchema.new
  validation_result = schema.call(data)

  return validation_result.to_h if validation_result.success?

  raise ArgumentError, "Validation failed: #{validation_result.errors.to_h}"
end
