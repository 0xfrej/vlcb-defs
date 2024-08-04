require 'erb'

class Renderer
  def initialize(context_path)
    @context_path = context_path
  end

  # Function to render an ERB template with a given context
  def r(template, context)
    # Construct the absolute path to the template file
    template = File.expand_path(File.join(@context_path, "#{template}.erb"))

    # Read the template file
    template = File.read(template)

    # Create an ERB renderer
    renderer = ERB.new(template)

    # Add the renderer itself to the context
    context[:renderer] = self

    # Render the template with the context
    renderer.result_with_hash(context)
  end
end
