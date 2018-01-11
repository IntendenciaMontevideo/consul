# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "capistrano3-delayed-job"
  spec.version       = "1.7.3"
  spec.authors       = ["Rob Biedenharn",
                        "Juan Ignacio Donoso",
                        "Agustin Feuerhake",
                        "Ignacio Baixas"]
  spec.email         = ["rob_biedenharn@alum.mit.edu",
                        "juan.ignacio@platan.us",
                        "agustin@platan.us",
                        "ignacio@platan.us"]
  spec.summary       = %q{Adds support for delayed_jobs to Capistrano 3.x}
  spec.description   = %q{Manage start/stop/restart/status of DelayedJob workers using Capistrano 3}
  spec.homepage      = "https://github.com/AgileConsultingLLC/capistrano3-delayed-job"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) {|f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'capistrano', '~> 3.0', '>= 3.0.0'
  spec.add_dependency 'daemons', '~> 1.2.4'

  spec.add_development_dependency "rake", ">= 10.0"
  spec.add_development_dependency "rubocop", "~> 0.0", '>= 0.39.0'
end
