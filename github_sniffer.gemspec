# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'github_sniffer/version'

Gem::Specification.new do |spec|
  spec.name          = 'github_sniffer'
  spec.version       = GithubSniffer::VERSION
  spec.authors       = ['rails-kung-foo']
  spec.email         = ['rails.kung.foo@gmail.com']

  spec.summary       = 'Simple command line tool to display user prefered language.'
  spec.description   = 'Simple command line tool to display user prefered language.'
  spec.homepage      = 'https://github.com/rails-kung-foo/github-sniffer'
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'thor', '~> 0.18'
  spec.add_dependency 'github_api', '~> 0.14.0'
  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'aruba'
  spec.add_development_dependency 'cucumber'
end
