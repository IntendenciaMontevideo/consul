# -*- encoding: utf-8 -*-
# stub: easy_translate 0.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "easy_translate".freeze
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["John Crepezzi".freeze]
  s.date = "2014-03-31"
  s.description = "easy_translate is a wrapper for the google translate API that makes sense programatically, and implements API keys".freeze
  s.email = "john.crepezzi@gmail.com".freeze
  s.homepage = "https://github.com/seejohnrun/easy_translate".freeze
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Google Translate API Wrapper for Ruby".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<json>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<thread>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<thread_safe>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<json>.freeze, [">= 0"])
      s.add_dependency(%q<thread>.freeze, [">= 0"])
      s.add_dependency(%q<thread_safe>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<json>.freeze, [">= 0"])
    s.add_dependency(%q<thread>.freeze, [">= 0"])
    s.add_dependency(%q<thread_safe>.freeze, [">= 0"])
  end
end
