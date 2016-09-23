# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jp_stock_rule/version'

Gem::Specification.new do |spec|
  spec.name          = "jp_stock_rule"
  spec.version       = JpStockRule::VERSION
  spec.authors       = ["Kouhei Yanagita"]
  spec.email         = ["yanagi@shakenbu.org"]

  spec.summary       = %q{JpStockRule is a utility for stock markets in Japan.}
  spec.description   = %q{JpStockRule is a utility for stock markets in Japan.}
  spec.homepage      = "https://github.com/kyanagi/jp_stock_rule"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
