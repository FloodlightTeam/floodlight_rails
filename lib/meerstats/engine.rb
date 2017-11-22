module Meerstats
  class Engine < ::Rails::Engine
    isolate_namespace Meerstats

    initializer 'meerstats.mount' do |app|
      app.routes.append do
        mount Meerstats::Engine => '/meerstats'
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
