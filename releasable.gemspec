$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "releasable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "releasable"
  s.version     = Releasable::VERSION
  s.authors     = ["Duy Trinh Duc"]
  s.email       = ["duytd.hanu@gmail.com"]
  s.summary       = "Pre-release Ruby On Rails application for white-list users"
  s.description   = "Pre-release Ruby On Rails application for white-list users"
  s.homepage      = "https://github.com/duytd/releasable"
  s.license = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.8"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 3.7"
  s.add_development_dependency "factory_bot_rails", "~> 4.8"
end
