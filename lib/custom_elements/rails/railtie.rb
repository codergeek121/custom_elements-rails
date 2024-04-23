module CustomElements
  module Rails
    class Railtie < ::Rails::Engine
      initializer "custom_elements-rails.assets.precompile" do |app|
        if app.config.respond_to? :assets
          app.config.assets.precompile += %w( custom_elements-rails.js )
        end
      end
    end
  end
end
