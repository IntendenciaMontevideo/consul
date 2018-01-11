# -*- encoding: utf-8 -*-
# stub: capistrano3-delayed-job 1.7.3 ruby lib

Gem::Specification.new do |s|
  s.name = "capistrano3-delayed-job".freeze
  s.version = "1.7.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Rob Biedenharn".freeze, "Juan Ignacio Donoso".freeze, "Agustin Feuerhake".freeze, "Ignacio Baixas".freeze]
  s.date = "2017-01-31"
  s.description = "Manage start/stop/restart/status of DelayedJob workers using Capistrano 3".freeze
  s.email = ["rob_biedenharn@alum.mit.edu".freeze, "juan.ignacio@platan.us".freeze, "agustin@platan.us".freeze, "ignacio@platan.us".freeze]
  s.homepage = "https://github.com/AgileConsultingLLC/capistrano3-delayed-job".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Adds support for delayed_jobs to Capistrano 3.x".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capistrano>.freeze, [">= 3.0.0", "~> 3.0"])
      s.add_runtime_dependency(%q<daemons>.freeze, ["~> 1.2.4"])
      s.add_development_dependency(%q<rake>.freeze, [">= 10.0"])
      s.add_development_dependency(%q<rubocop>.freeze, [">= 0.39.0", "~> 0.0"])
    else
      s.add_dependency(%q<capistrano>.freeze, [">= 3.0.0", "~> 3.0"])
      s.add_dependency(%q<daemons>.freeze, ["~> 1.2.4"])
      s.add_dependency(%q<rake>.freeze, [">= 10.0"])
      s.add_dependency(%q<rubocop>.freeze, [">= 0.39.0", "~> 0.0"])
    end
  else
    s.add_dependency(%q<capistrano>.freeze, [">= 3.0.0", "~> 3.0"])
    s.add_dependency(%q<daemons>.freeze, ["~> 1.2.4"])
    s.add_dependency(%q<rake>.freeze, [">= 10.0"])
    s.add_dependency(%q<rubocop>.freeze, [">= 0.39.0", "~> 0.0"])
  end
end
