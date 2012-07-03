module Ixtlan
  module Generators
    module Singleton

      def self.included(base)
        base.class_eval do
          class_option :singleton, :type => :boolean, :default => false

          if self.class.to_s =~  /ScaffoldGenerator$/

            protected
            alias :available_views_old :available_views
            def available_views
              if options[:singleton]
                %w(new create edit show destroy _form)
              else
                available_views_old
              end
            end

          end
        end
      end
    end
  end

  class Railtie < Rails::Railtie
    gmethod = config.respond_to?(:generators) ? :generators : :app_generators
    config.send(gmethod) do |config|

      config.templates << File.expand_path('../../generators/rails', __FILE__)

    end
  end
end
