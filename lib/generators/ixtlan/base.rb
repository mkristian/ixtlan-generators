require 'rails/generators/named_base'
module Ixtlan
  module Generators
    class Base < Rails::Generators::Base

      argument :name, :type => :string, :required => false

      class_option :dynamic, :type => :boolean, :default => true

      protected
      def generator_name
        raise "please overwrite generator_name"
      end

      def application_name
        @application_name ||= Rails.application.class.to_s.gsub(/::/,'').sub(/Application$/, '')
      end

      public

      def create_initializer_file
        if options[:dynamic]
          template 'dynamic.rb', File.join('config', "initializers", "ixtlan.rb")
        end
      end
    end
  end
end
