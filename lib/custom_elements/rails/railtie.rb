module CustomElements
  module Rails
    class Railtie < ::Rails::Engine
      initializer "custom_elements-rails.assets.precompile" do |app|
        if app.config.respond_to?(:assets)
          app.config.assets.precompile += %w( custom_elements-rails.js )
        end
      end

      initializer "custom_elements-rails.configure_spark", after: "hotwire_spark.config" do |app|
        spark_available = app.config.respond_to?(:hotwire) && app.config.hotwire.respond_to?(:spark)
        if spark_available
          # Custom elements don't seem to work with morphing
          Hotwire::Spark.html_reload_method = :replace

            # Just force full reloads after custom element change for now
          Hotwire::Spark.html_paths << ::Rails.root.join("app/javascript/custom_elements").to_s
          Hotwire::Spark.html_extensions << "js"
        end
      end
    end
  end
end
