# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'maybe_you_shouldnt/version'

Gem::Specification.new do |spec|
  spec.name          = "maybe_you_shouldnt"
  spec.version       = MaybeYouShouldnt::VERSION
  spec.authors       = ["TJ Taylor"]
  spec.email         = ["dugancathal@gmail.com"]

  spec.summary       = %q{Please, please, please, don't use try}
  spec.description   = %q{Please, please, please, don't use try}
  spec.homepage      = "https://github.com/dugancathal/maybe_you_shouldnt"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport', '~> 4'
  spec.add_dependency 'rails', '~> 4'
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
