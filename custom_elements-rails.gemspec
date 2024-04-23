require_relative "lib/custom_elements/rails/version"

Gem::Specification.new do |spec|
  spec.name        = "custom_elements-rails"
  spec.version     = CustomElements::Rails::VERSION
  spec.authors     = ["Niklas Häusele"]
  spec.email       = ["niklas.haeusele@hey.com"]
  spec.homepage    = "https://github.com/codergeek121/custom_elements-rails"
  spec.summary     = "Custom Elements + Rails + Importmaps = 🎉"
  spec.description = "A simple way to use custom elements to your Rails app. #nobuild"
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  # TODO
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.0"

  spec.add_development_dependency "appraisal"
end
