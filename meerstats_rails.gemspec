$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "meerstats/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "meerstats_rails"
  s.version     = Meerstats::VERSION
  s.authors     = ["meerstats"]
  s.email       = ["chuck@meerstats.com"]
  s.homepage    = "https://github.com/meerstats/meerstats_rails"
  s.summary     = "Mountable engine for Rails to provide application data to meerstats."
  s.description = "Mountable engine for Rails to provide application data to meerstats."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]
  s.executables = "meerstats"

  s.add_dependency "rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'pry'
end
