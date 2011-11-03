require 'generators/ixtlan/error_dumps_base'
module Ixtlan
  module Generators
    class ErrorDumpsScaffoldGenerator < ErrorDumpsBase
      
      source_root File.expand_path('../../templates', __FILE__)
      
      protected
      def generator_name
        "scaffold"
      end
    end
  end
end
