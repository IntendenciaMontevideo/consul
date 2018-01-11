# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails-assets-leaflet/version'

Gem::Specification.new do |spec|
  spec.name          = "rails-assets-leaflet"
  spec.version       = RailsAssetsLeaflet::VERSION
  spec.authors       = ["rails-assets.org"]
  spec.description   = "JavaScript library for mobile-friendly interactive maps"
  spec.summary       = "JavaScript library for mobile-friendly interactive maps"
  spec.homepage      = "https://github.com/Leaflet/Leaflet"
  spec.license       = "BSD-2-Clause"

  spec.files         = `find ./* -type f | cut -b 3-`.split($/)
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
