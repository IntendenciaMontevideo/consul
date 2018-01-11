# -*- encoding: utf-8 -*-
# stub: rvm1-capistrano3 1.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rvm1-capistrano3".freeze
  s.version = "1.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Michal Papis".freeze]
  s.date = "2015-10-15"
  s.description = "RVM 1.x / Capistrano 3.x Integration Gem".freeze
  s.email = ["mpapis@gmail.com".freeze]
  s.homepage = "https://github.com/rvm/rvm1-capistrano3".freeze
  s.licenses = ["Apache 2".freeze]
  s.rubygems_version = "2.6.11".freeze
  s.summary = "RVM 1.x / Capistrano 3.x Integration Gem".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capistrano>.freeze, ["~> 3.0"])
      s.add_runtime_dependency(%q<sshkit>.freeze, [">= 1.2"])
      s.add_development_dependency(%q<tf>.freeze, ["~> 0.4.3"])
    else
      s.add_dependency(%q<capistrano>.freeze, ["~> 3.0"])
      s.add_dependency(%q<sshkit>.freeze, [">= 1.2"])
      s.add_dependency(%q<tf>.freeze, ["~> 0.4.3"])
    end
  else
    s.add_dependency(%q<capistrano>.freeze, ["~> 3.0"])
    s.add_dependency(%q<sshkit>.freeze, [">= 1.2"])
    s.add_dependency(%q<tf>.freeze, ["~> 0.4.3"])
  end
end
