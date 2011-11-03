require 'generators/ixtlan/configuration_base'
module Ixtlan
  module Generators
    class ConfigurationScaffoldGenerator < ConfigurationBase
      
      source_root File.expand_path('../../templates', __FILE__)
      
      protected
      def generator_name
        "scaffold"
      end
    end
  end
end
