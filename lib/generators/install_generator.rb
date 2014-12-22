module CleanWeb
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    def create_config_file
      return unless options.empty?
      template 'clean_web.rb', 'config/initializers/clean_web.rb'
    end
  end
end