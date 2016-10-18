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

  s.add_dependency "rails",           "~> 4.2.6"
  s.add_dependency 'bootstrap-sass',  '~> 3.3.6'
  s.add_dependency 'sass-rails',      '>= 3.2'
  s.add_dependency 'haml-rails',      '~> 0.9'
  s.add_dependency 'jquery-rails',    '~> 4.1'
  s.add_dependency 'bootstrap_form',  '~> 2.3.0'
  s.add_dependency 'bootstrap-datepicker-rails',  '~> 1.6.4.1'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'faker'
end
