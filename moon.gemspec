$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "moon/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "moon"
  s.version     = Moon::VERSION
  s.authors     = ["Ivan Velasquez"]
  s.email       = ["ivan.velasquez.rios@gmail.com"]
  s.homepage    = "https://github.com/chukitow/moon"
  s.summary     = "Full-stack e-commerce framework for Ruby on Rails."
  s.description = "Moon is an open source e-commerce framework for Ruby on Rails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.6"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'database_cleaner'
end
