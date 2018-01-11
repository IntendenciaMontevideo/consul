# -*- encoding: utf-8 -*-
# stub: i18n-tasks 0.9.18 ruby lib

Gem::Specification.new do |s|
  s.name = "i18n-tasks".freeze
  s.version = "0.9.18"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "issue_tracker" => "https://github.com/glebm/i18n-tasks" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["glebm".freeze]
  s.date = "2017-08-13"
  s.description = "i18n-tasks helps you find and manage missing and unused translations.\n\nIt analyses code statically for key usages, such as `I18n.t('some.key')`, in order to report keys that are missing or unused,\npre-fill missing keys (optionally from Google Translate), and remove unused keys.\n".freeze
  s.email = ["glex.spb@gmail.com".freeze]
  s.executables = ["i18n-tasks".freeze]
  s.files = ["bin/i18n-tasks".freeze]
  s.homepage = "https://github.com/glebm/i18n-tasks".freeze
  s.licenses = ["MIT".freeze]
  s.post_install_message = "# Install default configuration:\ncp $(i18n-tasks gem-path)/templates/config/i18n-tasks.yml config/\n# Add an RSpec for missing and unused keys:\ncp $(i18n-tasks gem-path)/templates/rspec/i18n_spec.rb spec/\n".freeze
  s.required_ruby_version = Gem::Requirement.new("~> 2.1".freeze)
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Manage localization and translation with the awesome power of static analysis".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 4.0.2"])
      s.add_runtime_dependency(%q<ast>.freeze, [">= 2.1.0"])
      s.add_runtime_dependency(%q<easy_translate>.freeze, [">= 0.5.0"])
      s.add_runtime_dependency(%q<erubi>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<highline>.freeze, [">= 1.7.3"])
      s.add_runtime_dependency(%q<i18n>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<parser>.freeze, [">= 2.2.3.0"])
      s.add_runtime_dependency(%q<rainbow>.freeze, ["~> 2.2"])
      s.add_runtime_dependency(%q<terminal-table>.freeze, [">= 1.5.1"])
      s.add_development_dependency(%q<axlsx>.freeze, ["~> 2.0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.3"])
      s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<yard>.freeze, [">= 0"])
    else
      s.add_dependency(%q<activesupport>.freeze, [">= 4.0.2"])
      s.add_dependency(%q<ast>.freeze, [">= 2.1.0"])
      s.add_dependency(%q<easy_translate>.freeze, [">= 0.5.0"])
      s.add_dependency(%q<erubi>.freeze, [">= 0"])
      s.add_dependency(%q<highline>.freeze, [">= 1.7.3"])
      s.add_dependency(%q<i18n>.freeze, [">= 0"])
      s.add_dependency(%q<parser>.freeze, [">= 2.2.3.0"])
      s.add_dependency(%q<rainbow>.freeze, ["~> 2.2"])
      s.add_dependency(%q<terminal-table>.freeze, [">= 1.5.1"])
      s.add_dependency(%q<axlsx>.freeze, ["~> 2.0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.3"])
      s.add_dependency(%q<rubocop>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<yard>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 4.0.2"])
    s.add_dependency(%q<ast>.freeze, [">= 2.1.0"])
    s.add_dependency(%q<easy_translate>.freeze, [">= 0.5.0"])
    s.add_dependency(%q<erubi>.freeze, [">= 0"])
    s.add_dependency(%q<highline>.freeze, [">= 1.7.3"])
    s.add_dependency(%q<i18n>.freeze, [">= 0"])
    s.add_dependency(%q<parser>.freeze, [">= 2.2.3.0"])
    s.add_dependency(%q<rainbow>.freeze, ["~> 2.2"])
    s.add_dependency(%q<terminal-table>.freeze, [">= 1.5.1"])
    s.add_dependency(%q<axlsx>.freeze, ["~> 2.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.3"])
    s.add_dependency(%q<rubocop>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<yard>.freeze, [">= 0"])
  end
end
