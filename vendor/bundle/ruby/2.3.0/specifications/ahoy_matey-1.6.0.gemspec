# -*- encoding: utf-8 -*-
# stub: ahoy_matey 1.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "ahoy_matey".freeze
  s.version = "1.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Andrew Kane".freeze]
  s.date = "2017-05-01"
  s.description = "Simple, powerful visit tracking for Rails".freeze
  s.email = ["andrew@chartkick.com".freeze]
  s.homepage = "https://github.com/ankane/ahoy".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Simple, powerful visit tracking for Rails".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<addressable>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<browser>.freeze, ["~> 2.0"])
      s.add_runtime_dependency(%q<geocoder>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<referer-parser>.freeze, [">= 0.3.0"])
      s.add_runtime_dependency(%q<user_agent_parser>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<request_store>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<uuidtools>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<safely_block>.freeze, [">= 0.1.1"])
      s.add_runtime_dependency(%q<rack-attack>.freeze, ["< 6"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.5"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
      s.add_development_dependency(%q<activerecord>.freeze, [">= 0"])
      s.add_development_dependency(%q<pg>.freeze, [">= 0"])
      s.add_development_dependency(%q<mysql2>.freeze, [">= 0"])
    else
      s.add_dependency(%q<railties>.freeze, [">= 0"])
      s.add_dependency(%q<addressable>.freeze, [">= 0"])
      s.add_dependency(%q<browser>.freeze, ["~> 2.0"])
      s.add_dependency(%q<geocoder>.freeze, [">= 0"])
      s.add_dependency(%q<referer-parser>.freeze, [">= 0.3.0"])
      s.add_dependency(%q<user_agent_parser>.freeze, [">= 0"])
      s.add_dependency(%q<request_store>.freeze, [">= 0"])
      s.add_dependency(%q<uuidtools>.freeze, [">= 0"])
      s.add_dependency(%q<safely_block>.freeze, [">= 0.1.1"])
      s.add_dependency(%q<rack-attack>.freeze, ["< 6"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.5"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<minitest>.freeze, [">= 0"])
      s.add_dependency(%q<activerecord>.freeze, [">= 0"])
      s.add_dependency(%q<pg>.freeze, [">= 0"])
      s.add_dependency(%q<mysql2>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<railties>.freeze, [">= 0"])
    s.add_dependency(%q<addressable>.freeze, [">= 0"])
    s.add_dependency(%q<browser>.freeze, ["~> 2.0"])
    s.add_dependency(%q<geocoder>.freeze, [">= 0"])
    s.add_dependency(%q<referer-parser>.freeze, [">= 0.3.0"])
    s.add_dependency(%q<user_agent_parser>.freeze, [">= 0"])
    s.add_dependency(%q<request_store>.freeze, [">= 0"])
    s.add_dependency(%q<uuidtools>.freeze, [">= 0"])
    s.add_dependency(%q<safely_block>.freeze, [">= 0.1.1"])
    s.add_dependency(%q<rack-attack>.freeze, ["< 6"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.5"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_dependency(%q<activerecord>.freeze, [">= 0"])
    s.add_dependency(%q<pg>.freeze, [">= 0"])
    s.add_dependency(%q<mysql2>.freeze, [">= 0"])
  end
end
