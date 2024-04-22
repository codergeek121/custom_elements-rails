module CustomElements
  module Rails
    class Railtie < ::Rails::Engine
      initializer "custom_elements-rails.assets.precompile" do |app|
        app.config.assets.precompile += %w( custom_elements-rails.js )
      end
    end
  end
end
