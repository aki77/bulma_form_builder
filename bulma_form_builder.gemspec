lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bulma_form_builder/version"

Gem::Specification.new do |spec|
  spec.name          = "bulma_form_builder"
  spec.version       = BulmaFormBuilder::VERSION
  spec.authors       = ["aki77"]
  spec.email         = ["aki77@users.noreply.github.com"]

  spec.summary       = "Rails form builder"
  spec.description   = "bulma_form_builder is a Rails form builder that makes it super easy to integrate Bulma style forms into your Rails application."
  spec.homepage      = "https://github.com/aki77/bulma_form_builder"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 5.2.0"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
