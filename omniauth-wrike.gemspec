# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require File.expand_path('../lib/omniauth-wrike/version', __FILE__)

Gem::Specification.new do |spec|
  spec.version       = OmniAuth::Wrike::VERSION
  spec.name          = 'omniauth-wrike'
  spec.authors       = ['Juan Puelpan']
  spec.email         = ['juan@puelpan.com']
  spec.licenses      = ['MIT']
  spec.homepage      = 'https://github.com/Jpuelpan/omniauth-wrike'

  spec.summary       = %q{Wrike strategy for Omniauth.}
  spec.description   = %q{Wrike strategy for Omniauth.}

  spec.files         = `git ls-files`.split("\n")
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'omniauth-oauth2', '~> 1.3'
end
