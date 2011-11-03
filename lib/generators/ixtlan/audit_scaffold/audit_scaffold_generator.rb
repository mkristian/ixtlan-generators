require 'generators/ixtlan/audit_base'
module Ixtlan
  module Generators
    class AuditScaffoldGenerator < AuditBase
      
      source_root File.expand_path('../../templates', __FILE__)
      
      protected
      def generator_name
        "scaffold"
      end
    end
  end
end
