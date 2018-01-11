# -*- encoding: utf-8 -*-
# stub: scss_lint 0.54.0 ruby lib

Gem::Specification.new do |s|
  s.name = "scss_lint".freeze
  s.version = "0.54.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Brigade Engineering".freeze, "Shane da Silva".freeze]
  s.date = "2017-06-14"
  s.description = "Configurable tool for writing clean and consistent SCSS".freeze
  s.email = ["eng@brigade.com".freeze, "shane.dasilva@brigade.com".freeze]
  s.executables = ["scss-lint".freeze]
  s.files = ["bin/scss-lint".freeze]
  s.homepage = "https://github.com/brigade/scss-lint".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2".freeze)
  s.rubygems_version = "2.6.11".freeze
  s.summary = "SCSS lint tool".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>.freeze, ["< 13", ">= 0.9"])
      s.add_runtime_dependency(%q<sass>.freeze, ["~> 3.4.20"])
    else
      s.add_dependency(%q<rake>.freeze, ["< 13", ">= 0.9"])
      s.add_dependency(%q<sass>.freeze, ["~> 3.4.20"])
    end
  else
    s.add_dependency(%q<rake>.freeze, ["< 13", ">= 0.9"])
    s.add_dependency(%q<sass>.freeze, ["~> 3.4.20"])
  end
end
