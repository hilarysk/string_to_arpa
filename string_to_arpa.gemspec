# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'string_to_arpa/version'

Gem::Specification.new do |spec|
  spec.name          = "string_to_arpa"
  spec.version       = StringToArpa::VERSION
  spec.authors       = ["Hilary Stohs-Krause"]
  spec.email         = ["hilarysk@gmail.com"]
  
  spec.summary       = %q{A minimalist gem that converts a string to Arpabet.}
  spec.description   = %q{This gem converts strings to Arpabet, a phonetic transcription code used in several speech synthesizers.}
  spec.homepage      = "https://github.com/hilarysk/string_to_arpa"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_dependency "sqlite3"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  
end
