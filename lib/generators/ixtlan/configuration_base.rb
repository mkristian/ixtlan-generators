require 'generators/ixtlan/base'
module Ixtlan
  module Generators
    class ConfigurationBase < Base

      def create
        args = []
        if name
          args << ARGV.shift
        else
          args << "configuration"
        end

        if defined? ::Ixtlan::Errors
          args << "errors_keep_dumps:integer"
          args << "errors_base_url:string"
          args << "errors_from_email:string"
          args << "errors_to_emails:string"
        end

        if defined? ::Ixtlan::Sessions
          args << "idle_session_timeout:integer"
        end

        if defined? ::Ixtlan::Audit
          args << "audits_keep_logs:integer"
        end
        
        args += ARGV
        
        args += ["--singleton", "--timestamps"]

        generate generator_name, *args
      end

      def create_seed
        template 'seed.rb', File.join('db', 'seed.rb')
      end
    end
  end
end
