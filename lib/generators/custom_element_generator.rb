class CustomElementGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  argument :attributes, type: :array, default: [], banner: "Observed attributes"

  def copy_custom_element
    template "custom_element.js", "app/javascript/custom_elements/#{file_name}_element.js"
  end
end

