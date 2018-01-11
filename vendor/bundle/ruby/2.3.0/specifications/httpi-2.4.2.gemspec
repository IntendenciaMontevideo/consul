# -*- encoding: utf-8 -*-
# stub: httpi 2.4.2 ruby lib

Gem::Specification.new do |s|
  s.name = "httpi".freeze
  s.version = "2.4.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Daniel Harrington".freeze, "Martin Tepper".freeze]
  s.date = "2016-04-29"
  s.description = "Common interface for Ruby's HTTP libraries".freeze
  s.email = "me@rubiii.com".freeze
  s.homepage = "http://github.com/savonrb/httpi".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2".freeze)
  s.rubyforge_project = "httpi".freeze
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Common interface for Ruby's HTTP libraries".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<socksify>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubyntlm>.freeze, ["~> 0.3.2"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2.14"])
      s.add_development_dependency(%q<mocha>.freeze, ["~> 0.13"])
      s.add_development_dependency(%q<puma>.freeze, ["~> 2.3.2"])
      s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rack>.freeze, [">= 0"])
      s.add_dependency(%q<socksify>.freeze, [">= 0"])
      s.add_dependency(%q<rubyntlm>.freeze, ["~> 0.3.2"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 2.14"])
      s.add_dependency(%q<mocha>.freeze, ["~> 0.13"])
      s.add_dependency(%q<puma>.freeze, ["~> 2.3.2"])
      s.add_dependency(%q<webmock>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rack>.freeze, [">= 0"])
    s.add_dependency(%q<socksify>.freeze, [">= 0"])
    s.add_dependency(%q<rubyntlm>.freeze, ["~> 0.3.2"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.14"])
    s.add_dependency(%q<mocha>.freeze, ["~> 0.13"])
    s.add_dependency(%q<puma>.freeze, ["~> 2.3.2"])
    s.add_dependency(%q<webmock>.freeze, [">= 0"])
  end
end
