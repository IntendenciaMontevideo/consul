# -*- encoding: utf-8 -*-
# stub: devise_security_extension 0.10.0 ruby lib

Gem::Specification.new do |s|
  s.name = "devise_security_extension".freeze
  s.version = "0.10.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Marco Scholl".freeze, "Alexander Dreher".freeze]
  s.date = "2016-03-10"
  s.description = "An enterprise security extension for devise, trying to meet industrial standard security demands for web applications.".freeze
  s.email = "team@phatworx.de".freeze
  s.homepage = "https://github.com/phatworx/devise_security_extension".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubyforge_project = "devise_security_extension".freeze
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Security extension for devise".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>.freeze, ["< 5.0", ">= 3.2.6"])
      s.add_runtime_dependency(%q<devise>.freeze, ["< 4.0", ">= 3.0.0"])
      s.add_development_dependency(%q<bundler>.freeze, ["< 2.0", ">= 1.3.0"])
      s.add_development_dependency(%q<sqlite3>.freeze, ["~> 1.3.10"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0"])
      s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
      s.add_development_dependency(%q<easy_captcha>.freeze, ["~> 0"])
      s.add_development_dependency(%q<rails_email_validator>.freeze, ["~> 0"])
    else
      s.add_dependency(%q<railties>.freeze, ["< 5.0", ">= 3.2.6"])
      s.add_dependency(%q<devise>.freeze, ["< 4.0", ">= 3.0.0"])
      s.add_dependency(%q<bundler>.freeze, ["< 2.0", ">= 1.3.0"])
      s.add_dependency(%q<sqlite3>.freeze, ["~> 1.3.10"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0"])
      s.add_dependency(%q<minitest>.freeze, [">= 0"])
      s.add_dependency(%q<easy_captcha>.freeze, ["~> 0"])
      s.add_dependency(%q<rails_email_validator>.freeze, ["~> 0"])
    end
  else
    s.add_dependency(%q<railties>.freeze, ["< 5.0", ">= 3.2.6"])
    s.add_dependency(%q<devise>.freeze, ["< 4.0", ">= 3.0.0"])
    s.add_dependency(%q<bundler>.freeze, ["< 2.0", ">= 1.3.0"])
    s.add_dependency(%q<sqlite3>.freeze, ["~> 1.3.10"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_dependency(%q<easy_captcha>.freeze, ["~> 0"])
    s.add_dependency(%q<rails_email_validator>.freeze, ["~> 0"])
  end
end
