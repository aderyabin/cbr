lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cbr/version'

Gem::Specification.new do |spec|
  spec.name          = "cbr"
  spec.version       = CBR::VERSION
  spec.authors       = ["Andrey Deryabin"]
  spec.email         = ["deriabin@gmail.com"]
  spec.summary       = %q{Ruby wrapper for The Central Bank of the Russian Federation API}
  spec.description   = %q{Ruby wrapper for The Central Bank of the Russian Federation API}
  spec.homepage      = "http://github.com/aderyabin/cbr"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency 'sax-machine', '~> 1.0'
  spec.add_dependency 'curb',        '~> 0.8'
end
