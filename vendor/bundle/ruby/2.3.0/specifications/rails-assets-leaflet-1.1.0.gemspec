# -*- encoding: utf-8 -*-
# stub: rails-assets-leaflet 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rails-assets-leaflet".freeze
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["rails-assets.org".freeze]
  s.date = "2017-06-28"
  s.description = "JavaScript library for mobile-friendly interactive maps".freeze
  s.homepage = "https://github.com/Leaflet/Leaflet".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.rubygems_version = "2.6.11".freeze
  s.summary = "JavaScript library for mobile-friendly interactive maps".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
