# just definde the class if it comes from the rails model generator
if defined?(Rails::Generators::ModelGenerator) && defined?(ActiveRecord)
  require 'rails/generators/active_record/model/model_generator'

  module ActiveRecord
    module Generators
      class ModelGenerator < Base
        include ::Ixtlan::Generators::Singleton
        
        argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
        
        check_class_collision
        
        class_option :migration,   :type => :boolean
        class_option :timestamps,  :type => :boolean
        class_option :modified_by, :type => :boolean, :default => false
        class_option :singleton,   :type => :boolean, :default => false
        class_option :parent,      :type => :string, :desc => "The parent class for the generated model"
        
        def create_migration_file
          return unless options[:migration] && options[:parent].nil?
          migration_template "migration.rb", "db/migrate/create_#{table_name}.rb"
        end
        
        def create_model_file
          template 'model.rb', File.join('app/models', class_path, "#{file_name}.rb")
        end
        
        def create_module_file
          return if class_path.empty?
          template 'module.rb', File.join('app/models', "#{class_path.join('/')}.rb") if behavior == :invoke
        end
        
        hook_for :test_framework
        
        protected
        
        def parent_class_name
          options[:parent] || "ActiveRecord::Base"
        end
        
      end
    end
  end
  
else
  raise "ignore this file"
end
