module Ixtlan
  class Railtie < Rails::Railtie
    config.generators do |config|
        
      config.templates << File.expand_path('../../generators/rails', __FILE__)
      
    end
  end
end
