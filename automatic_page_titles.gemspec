$LOAD_PATH.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "automatic_page_titles/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "automatic_page_titles"
  s.version     = AutomaticPageTitles::VERSION
  s.authors     = ["neilang"]
  s.email       = ["neilang@gmail.com"]
  s.homepage    = "https://github.com/neilang/automatic_page_titles"
  s.summary     = "Smart page title defaults for your Rails app."
  s.description = "Allows you to easily set page titles per view in your Rails 4 app, but also follows Ruby on Rails "\
                  "naming conventions to set sensible default title if none is specified."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_development_dependency "rails", "~> 5.2"
  s.add_development_dependency "sqlite3", "~> 1.3"
  s.add_development_dependency "rspec-rails", "~> 3.7"
  s.add_development_dependency "rubocop", "~> 0.55"
  s.add_development_dependency "capybara", "~> 3.0"
end
