class CustomElementGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  def copy_custom_element
    template "custom_element.js", "app/javascript/custom_elements/#{file_name}_element.js"
  end
end

