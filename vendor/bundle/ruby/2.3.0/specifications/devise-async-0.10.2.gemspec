# -*- encoding: utf-8 -*-
# stub: devise-async 0.10.2 ruby lib

Gem::Specification.new do |s|
  s.name = "devise-async".freeze
  s.version = "0.10.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Marcelo Silveira".freeze]
  s.date = "2016-05-27"
  s.description = "Send Devise's emails in background. Supports Backburner, Resque, Sidekiq, Delayed::Job, QueueClassic, Que, Sucker Punch and Torquebox.".freeze
  s.email = ["marcelo@mhfs.com.br".freeze]
  s.homepage = "https://github.com/mhfs/devise-async/".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Devise Async provides an easy way to configure Devise to send its emails asynchronously using your preferred queuing backend. It supports Backburner, Resque, Sidekiq, Delayed::Job, QueueClassic, Que, Sucker Punch and Torquebox.".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<devise>.freeze, ["< 4.0", ">= 3.2"])
      s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
      s.add_development_dependency(%q<activerecord>.freeze, [">= 3.2"])
      s.add_development_dependency(%q<actionpack>.freeze, [">= 3.2"])
      s.add_development_dependency(%q<actionmailer>.freeze, [">= 3.2"])
      s.add_development_dependency(%q<sqlite3>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<resque>.freeze, ["~> 1.20"])
      s.add_development_dependency(%q<sidekiq>.freeze, ["~> 2.17"])
      s.add_development_dependency(%q<delayed_job_active_record>.freeze, ["~> 0.3"])
      s.add_development_dependency(%q<queue_classic>.freeze, ["~> 2.0"])
      s.add_development_dependency(%q<backburner>.freeze, ["~> 0.4"])
      s.add_development_dependency(%q<mocha>.freeze, ["~> 0.11"])
      s.add_development_dependency(%q<torquebox-no-op>.freeze, ["~> 2.3"])
      s.add_development_dependency(%q<sucker_punch>.freeze, ["~> 1.0.5"])
      s.add_development_dependency(%q<que>.freeze, ["~> 0.8"])
    else
      s.add_dependency(%q<devise>.freeze, ["< 4.0", ">= 3.2"])
      s.add_dependency(%q<minitest>.freeze, [">= 0"])
      s.add_dependency(%q<activerecord>.freeze, [">= 3.2"])
      s.add_dependency(%q<actionpack>.freeze, [">= 3.2"])
      s.add_dependency(%q<actionmailer>.freeze, [">= 3.2"])
      s.add_dependency(%q<sqlite3>.freeze, ["~> 1.3"])
      s.add_dependency(%q<resque>.freeze, ["~> 1.20"])
      s.add_dependency(%q<sidekiq>.freeze, ["~> 2.17"])
      s.add_dependency(%q<delayed_job_active_record>.freeze, ["~> 0.3"])
      s.add_dependency(%q<queue_classic>.freeze, ["~> 2.0"])
      s.add_dependency(%q<backburner>.freeze, ["~> 0.4"])
      s.add_dependency(%q<mocha>.freeze, ["~> 0.11"])
      s.add_dependency(%q<torquebox-no-op>.freeze, ["~> 2.3"])
      s.add_dependency(%q<sucker_punch>.freeze, ["~> 1.0.5"])
      s.add_dependency(%q<que>.freeze, ["~> 0.8"])
    end
  else
    s.add_dependency(%q<devise>.freeze, ["< 4.0", ">= 3.2"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_dependency(%q<activerecord>.freeze, [">= 3.2"])
    s.add_dependency(%q<actionpack>.freeze, [">= 3.2"])
    s.add_dependency(%q<actionmailer>.freeze, [">= 3.2"])
    s.add_dependency(%q<sqlite3>.freeze, ["~> 1.3"])
    s.add_dependency(%q<resque>.freeze, ["~> 1.20"])
    s.add_dependency(%q<sidekiq>.freeze, ["~> 2.17"])
    s.add_dependency(%q<delayed_job_active_record>.freeze, ["~> 0.3"])
    s.add_dependency(%q<queue_classic>.freeze, ["~> 2.0"])
    s.add_dependency(%q<backburner>.freeze, ["~> 0.4"])
    s.add_dependency(%q<mocha>.freeze, ["~> 0.11"])
    s.add_dependency(%q<torquebox-no-op>.freeze, ["~> 2.3"])
    s.add_dependency(%q<sucker_punch>.freeze, ["~> 1.0.5"])
    s.add_dependency(%q<que>.freeze, ["~> 0.8"])
  end
end
