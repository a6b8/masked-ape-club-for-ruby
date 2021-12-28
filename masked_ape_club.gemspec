# frozen_string_literal: true

require_relative "lib/masked_ape_club/version"

Gem::Specification.new do |spec|
  spec.name = "masked_ape_club"
  spec.version = MaskedApeClub::VERSION
  spec.authors = ["a6b8"]
  spec.email = ["hello@13plus4.com"]

  spec.summary = "Let the apes out."
  spec.description = "Let the apes out and free them from backgrounds. With the goal to bring them to context."
  spec.homepage = "https://github.com/a6b8/masked-ape-club-for-ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/a6b8/masked-ape-club-for-ruby"
  spec.metadata["changelog_uri"] = "https://raw.githubusercontent.com/a6b8/masked-ape-club-for-ruby/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "rmagick", "~> 4.2.3"
  spec.add_dependency "net-http", "~> 0.1.1"
  spec.add_dependency "uri", "~> 0.10.1"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
