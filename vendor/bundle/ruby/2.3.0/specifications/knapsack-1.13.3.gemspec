# -*- encoding: utf-8 -*-
# stub: knapsack 1.13.3 ruby lib

Gem::Specification.new do |s|
  s.name = "knapsack".freeze
  s.version = "1.13.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ArturT".freeze]
  s.date = "2017-04-03"
  s.description = "Parallel tests across CI server nodes based on each test file's time execution. It generates a test time execution report and uses it for future test runs.".freeze
  s.email = ["arturtrzop@gmail.com".freeze]
  s.executables = ["knapsack".freeze, "print_header.sh".freeze]
  s.files = ["bin/knapsack".freeze, "bin/print_header.sh".freeze]
  s.homepage = "https://github.com/ArturT/knapsack".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Knapsack splits tests across CI nodes and makes sure that tests will run comparable time on each node.".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<timecop>.freeze, [">= 0.1.0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 2.0.0", "~> 3.0"])
      s.add_development_dependency(%q<rspec-its>.freeze, ["~> 1.2"])
      s.add_development_dependency(%q<cucumber>.freeze, [">= 0"])
      s.add_development_dependency(%q<spinach>.freeze, [">= 0.8"])
      s.add_development_dependency(%q<minitest>.freeze, [">= 5.0.0"])
      s.add_development_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 0"])
      s.add_development_dependency(%q<pry>.freeze, ["~> 0"])
    else
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<timecop>.freeze, [">= 0.1.0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_dependency(%q<rspec>.freeze, [">= 2.0.0", "~> 3.0"])
      s.add_dependency(%q<rspec-its>.freeze, ["~> 1.2"])
      s.add_dependency(%q<cucumber>.freeze, [">= 0"])
      s.add_dependency(%q<spinach>.freeze, [">= 0.8"])
      s.add_dependency(%q<minitest>.freeze, [">= 5.0.0"])
      s.add_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 0"])
      s.add_dependency(%q<pry>.freeze, ["~> 0"])
    end
  else
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<timecop>.freeze, [">= 0.1.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
    s.add_dependency(%q<rspec>.freeze, [">= 2.0.0", "~> 3.0"])
    s.add_dependency(%q<rspec-its>.freeze, ["~> 1.2"])
    s.add_dependency(%q<cucumber>.freeze, [">= 0"])
    s.add_dependency(%q<spinach>.freeze, [">= 0.8"])
    s.add_dependency(%q<minitest>.freeze, [">= 5.0.0"])
    s.add_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 0"])
    s.add_dependency(%q<pry>.freeze, ["~> 0"])
  end
end
