module Floodlight
  class Engine < ::Rails::Engine
    isolate_namespace Floodlight

    initializer 'floodlight.mount' do |app|
      app.routes.append do
        mount Floodlight::Engine => '/floodlight'
      end
    end

    config.generators do |g|
      g.test_framework :rspec, :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end
