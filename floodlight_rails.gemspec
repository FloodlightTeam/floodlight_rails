$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "floodlight/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "floodlight_rails"
  s.version     = Floodlight::VERSION
  s.authors     = ["Floodlight"]
  s.email       = ["chuck@callebs.io"]
  s.homepage    = "https://github.com/FloodlightTeam/floodlight_rails"
  s.summary     = "Mountable engine for Rails to provide application data to Floodlight."
  s.description = "Mountable engine for Rails to provide application data to Floodlight."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]
  s.executables = "floodlight"

  s.add_dependency "rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'pry'
end
