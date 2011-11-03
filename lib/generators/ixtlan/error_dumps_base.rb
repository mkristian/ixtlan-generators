require 'generators/ixtlan/base'
module Ixtlan
  module Generators
    class ErrorDumpsBase < Base

      def create
        args = []
        if name
          args << ARGV.shift
        else
          args << "error"
        end

        args << 'message:string request:text response:text session:text parameters:text clazz:string backtrace:text'
        args += ARGV
        
        args << "--read-only --timestamps"

        generate generator_name, *args
      end
    end
  end
end
