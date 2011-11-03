require 'generators/ixtlan/configuration_base'
module Ixtlan
  module Generators
    class ConfigurationModelGenerator < ConfigurationBase

      source_root File.expand_path('../../templates', __FILE__)
      
      protected
      def generator_name
        "model"
      end
    end
  end
end
