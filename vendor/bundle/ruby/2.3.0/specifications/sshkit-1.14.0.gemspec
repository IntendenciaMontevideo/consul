# -*- encoding: utf-8 -*-
# stub: sshkit 1.14.0 ruby lib

Gem::Specification.new do |s|
  s.name = "sshkit".freeze
  s.version = "1.14.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Lee Hambley".freeze, "Tom Clements".freeze]
  s.date = "2017-06-30"
  s.description = "A comprehensive toolkit for remotely running commands in a structured manner on groups of servers.".freeze
  s.email = ["lee.hambley@gmail.com".freeze, "seenmyfate@gmail.com".freeze]
  s.homepage = "http://github.com/capistrano/sshkit".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.11".freeze
  s.summary = "SSHKit makes it easy to write structured, testable SSH commands in Ruby".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<net-ssh>.freeze, [">= 2.8.0"])
      s.add_runtime_dependency(%q<net-scp>.freeze, [">= 1.1.2"])
      s.add_development_dependency(%q<danger>.freeze, [">= 0"])
      s.add_development_dependency(%q<minitest>.freeze, [">= 5.0.0"])
      s.add_development_dependency(%q<minitest-reporters>.freeze, [">= 0"])
      s.add_development_dependency(%q<rainbow>.freeze, ["~> 2.1.0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.49.1"])
      s.add_development_dependency(%q<mocha>.freeze, [">= 0"])
      s.add_development_dependency(%q<bcrypt_pbkdf>.freeze, [">= 0"])
      s.add_development_dependency(%q<rbnacl>.freeze, ["~> 3.4"])
      s.add_development_dependency(%q<rbnacl-libsodium>.freeze, [">= 0"])
    else
      s.add_dependency(%q<net-ssh>.freeze, [">= 2.8.0"])
      s.add_dependency(%q<net-scp>.freeze, [">= 1.1.2"])
      s.add_dependency(%q<danger>.freeze, [">= 0"])
      s.add_dependency(%q<minitest>.freeze, [">= 5.0.0"])
      s.add_dependency(%q<minitest-reporters>.freeze, [">= 0"])
      s.add_dependency(%q<rainbow>.freeze, ["~> 2.1.0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.49.1"])
      s.add_dependency(%q<mocha>.freeze, [">= 0"])
      s.add_dependency(%q<bcrypt_pbkdf>.freeze, [">= 0"])
      s.add_dependency(%q<rbnacl>.freeze, ["~> 3.4"])
      s.add_dependency(%q<rbnacl-libsodium>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<net-ssh>.freeze, [">= 2.8.0"])
    s.add_dependency(%q<net-scp>.freeze, [">= 1.1.2"])
    s.add_dependency(%q<danger>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 5.0.0"])
    s.add_dependency(%q<minitest-reporters>.freeze, [">= 0"])
    s.add_dependency(%q<rainbow>.freeze, ["~> 2.1.0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.49.1"])
    s.add_dependency(%q<mocha>.freeze, [">= 0"])
    s.add_dependency(%q<bcrypt_pbkdf>.freeze, [">= 0"])
    s.add_dependency(%q<rbnacl>.freeze, ["~> 3.4"])
    s.add_dependency(%q<rbnacl-libsodium>.freeze, [">= 0"])
  end
end
