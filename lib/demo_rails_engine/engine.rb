module DemoRailsEngine
  class Engine < ::Rails::Engine
    isolate_namespace DemoRailsEngine

    initializer 'assets.precompile' do |app|
      app.config.assets.precompile += %w(application.js application.scss)
    end
    
    # config.assets.paths << File.expand_path("../../assets/stylesheets/demo_rails_engine", __FILE__)
    # config.assets.paths << File.expand_path("../../assets/javascripts", __FILE__)
    # config.assets.precompile += %w( application.css application.js )   
  end
end
