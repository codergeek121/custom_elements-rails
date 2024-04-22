namespace :custom_elements do
  desc "Installation"
  task :install do
    puts "Installing custom_elements-rails"
    system "rails app:template LOCATION=#{File.expand_path('../../install/install.rb', __dir__)}"
  end
end
