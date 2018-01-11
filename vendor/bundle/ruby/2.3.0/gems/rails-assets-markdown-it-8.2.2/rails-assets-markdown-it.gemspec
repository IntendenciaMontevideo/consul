# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails-assets-markdown-it/version'

Gem::Specification.new do |spec|
  spec.name          = "rails-assets-markdown-it"
  spec.version       = RailsAssetsMarkdownIt::VERSION
  spec.authors       = ["rails-assets.org"]
  spec.description   = "Markdown parser, done right. Commonmark support, extensions, syntax plugins, high speed - all in one."
  spec.summary       = "Markdown parser, done right. Commonmark support, extensions, syntax plugins, high speed - all in one."
  spec.homepage      = "https://github.com/markdown-it/markdown-it"
  spec.license       = "MIT"

  spec.files         = `find ./* -type f | cut -b 3-`.split($/)
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
