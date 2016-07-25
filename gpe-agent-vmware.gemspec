# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gpe-agent-vmware/helpers/version'

Gem::Specification.new do |spec|
  spec.name          = "gpe-agent-vmware"
  spec.version       = Gpe::Agent::Vmware::VERSION
  spec.authors       = ["Rich Davis"]
  spec.email         = ["rdavis@galileosuite.com"]
  spec.description   = %q{VMware Access}
  spec.summary       = %q{Pull Performance Stats from VMware}
  spec.homepage      = ""
  spec.license       = "Galileo EULA"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
