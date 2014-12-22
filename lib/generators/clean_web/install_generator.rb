module CleanWeb
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)
      def create_config_file
        template 'clean_web.rb', 'config/initializers/clean_web.rb'
      end
    end
  end
end
