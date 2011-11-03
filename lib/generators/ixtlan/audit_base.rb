require 'generators/ixtlan/base'
module Ixtlan
  module Generators
    class AuditBase < Base

      def create
        args = []
        if name
          args << ARGV.shift
        else
          args << "audit"
        end

        args << 'login:string message:string'
        args += ARGV
        
        args << "--read-only --timestamps"

        generate generator_name, *args
      end
    end
  end
end
