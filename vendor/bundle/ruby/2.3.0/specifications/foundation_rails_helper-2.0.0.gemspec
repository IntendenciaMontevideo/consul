# -*- encoding: utf-8 -*-
# stub: foundation_rails_helper 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "foundation_rails_helper".freeze
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sebastien Gruhier".freeze]
  s.date = "2016-09-16"
  s.description = "Rails for zurb foundation CSS framework. Form builder, flash message, ...".freeze
  s.email = ["sebastien.gruhier@xilinus.com".freeze]
  s.homepage = "http://github.com/sgruhier/foundation_rails_helper".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Rails helpers for zurb foundation CSS framework".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>.freeze, [">= 4.1"])
      s.add_runtime_dependency(%q<actionpack>.freeze, [">= 4.1"])
      s.add_runtime_dependency(%q<activemodel>.freeze, [">= 4.1"])
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 4.1"])
      s.add_runtime_dependency(%q<tzinfo>.freeze, [">= 1.2.2", "~> 1.2"])
      s.add_development_dependency(%q<rspec-rails>.freeze, [">= 3.1"])
      s.add_development_dependency(%q<mime-types>.freeze, ["~> 2"])
      s.add_development_dependency(%q<capybara>.freeze, ["~> 2.7"])
      s.add_development_dependency(%q<rubocop>.freeze, ["> 0.41"])
    else
      s.add_dependency(%q<railties>.freeze, [">= 4.1"])
      s.add_dependency(%q<actionpack>.freeze, [">= 4.1"])
      s.add_dependency(%q<activemodel>.freeze, [">= 4.1"])
      s.add_dependency(%q<activesupport>.freeze, [">= 4.1"])
      s.add_dependency(%q<tzinfo>.freeze, [">= 1.2.2", "~> 1.2"])
      s.add_dependency(%q<rspec-rails>.freeze, [">= 3.1"])
      s.add_dependency(%q<mime-types>.freeze, ["~> 2"])
      s.add_dependency(%q<capybara>.freeze, ["~> 2.7"])
      s.add_dependency(%q<rubocop>.freeze, ["> 0.41"])
    end
  else
    s.add_dependency(%q<railties>.freeze, [">= 4.1"])
    s.add_dependency(%q<actionpack>.freeze, [">= 4.1"])
    s.add_dependency(%q<activemodel>.freeze, [">= 4.1"])
    s.add_dependency(%q<activesupport>.freeze, [">= 4.1"])
    s.add_dependency(%q<tzinfo>.freeze, [">= 1.2.2", "~> 1.2"])
    s.add_dependency(%q<rspec-rails>.freeze, [">= 3.1"])
    s.add_dependency(%q<mime-types>.freeze, ["~> 2"])
    s.add_dependency(%q<capybara>.freeze, ["~> 2.7"])
    s.add_dependency(%q<rubocop>.freeze, ["> 0.41"])
  end
end
