# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "github_sloc/version"

Gem::Specification.new do |spec|
  spec.name          = "github_sloc"
  spec.version       = GithubSloc::VERSION
  spec.authors       = ["Caleb Smith"]
  spec.email         = ["karagenit@outlook.com"]

  spec.summary       = 'Github SLOC'
  spec.description   = 'Find How Many SLOC You\'ve Commited to Github'
  spec.homepage      = "https://github.com/karagenit/sloc"
  spec.license       = "MIT"

  spec.bindir        = "exe"
  spec.executables   = ['github_sloc']
  spec.require_paths = ["lib"]
  spec.files         = ['lib/github_sloc/query.json']

  spec.add_runtime_dependency     "octokit", "~> 4.7"
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
end
