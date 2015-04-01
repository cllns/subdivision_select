$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "subdivision_select/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = "subdivision_select"
  s.version = SubdivisionSelect::VERSION
  s.authors = ["Sean Collins"]
  s.email = ["sean@cllns.com"]
  s.homepage = "https://github.com/cllns/subdivision_select"
  s.summary = "A Rails Engine to fill in a select box based on a country_select"
  s.license = "MIT"

  s.files = Dir[
    "{app,config,db,lib}/**/*",
    "MIT-LICENSE",
    "Rakefile",
    "README.rdoc"
  ]

  s.add_dependency "rails", "~> 4.1.0"
  s.add_dependency "country_select", "~> 2.0"

  s.add_development_dependency "sqlite3"

  s.add_development_dependency "rspec-rails", "~> 3.2.0"
  s.add_development_dependency "factory_girl_rails", "~> 4.5.0"
end
