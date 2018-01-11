# -*- encoding: utf-8 -*-
# stub: email_spec 2.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "email_spec".freeze
  s.version = "2.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ben Mabey".freeze, "Aaron Gibralter".freeze, "Mischa Fierer".freeze]
  s.date = "2017-05-16"
  s.description = "Easily test email in RSpec, Cucumber, and MiniTest".freeze
  s.email = "ben@benmabey.com".freeze
  s.extra_rdoc_files = ["README.md".freeze, "MIT-LICENSE.txt".freeze]
  s.files = ["MIT-LICENSE.txt".freeze, "README.md".freeze]
  s.homepage = "http://github.com/email-spec/email-spec/".freeze
  s.licenses = ["MIT".freeze]
  s.rubyforge_project = "email-spec".freeze
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Easily test email in RSpec, Cucumber or Minitest".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<htmlentities>.freeze, ["~> 4.3.3"])
      s.add_runtime_dependency(%q<launchy>.freeze, ["~> 2.1"])
      s.add_runtime_dependency(%q<mail>.freeze, ["~> 2.6"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0.8.7"])
      s.add_development_dependency(%q<cucumber>.freeze, ["~> 1.3.17"])
      s.add_development_dependency(%q<actionmailer>.freeze, ["~> 4.2"])
      s.add_development_dependency(%q<rack-test>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.1"])
      s.add_development_dependency(%q<capybara>.freeze, [">= 0"])
      s.add_development_dependency(%q<database_cleaner>.freeze, [">= 0"])
      s.add_development_dependency(%q<test-unit>.freeze, [">= 0"])
    else
      s.add_dependency(%q<htmlentities>.freeze, ["~> 4.3.3"])
      s.add_dependency(%q<launchy>.freeze, ["~> 2.1"])
      s.add_dependency(%q<mail>.freeze, ["~> 2.6"])
      s.add_dependency(%q<rake>.freeze, [">= 0.8.7"])
      s.add_dependency(%q<cucumber>.freeze, ["~> 1.3.17"])
      s.add_dependency(%q<actionmailer>.freeze, ["~> 4.2"])
      s.add_dependency(%q<rack-test>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.1"])
      s.add_dependency(%q<capybara>.freeze, [">= 0"])
      s.add_dependency(%q<database_cleaner>.freeze, [">= 0"])
      s.add_dependency(%q<test-unit>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<htmlentities>.freeze, ["~> 4.3.3"])
    s.add_dependency(%q<launchy>.freeze, ["~> 2.1"])
    s.add_dependency(%q<mail>.freeze, ["~> 2.6"])
    s.add_dependency(%q<rake>.freeze, [">= 0.8.7"])
    s.add_dependency(%q<cucumber>.freeze, ["~> 1.3.17"])
    s.add_dependency(%q<actionmailer>.freeze, ["~> 4.2"])
    s.add_dependency(%q<rack-test>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.1"])
    s.add_dependency(%q<capybara>.freeze, [">= 0"])
    s.add_dependency(%q<database_cleaner>.freeze, [">= 0"])
    s.add_dependency(%q<test-unit>.freeze, [">= 0"])
  end
end
