# frozen_string_literal: true

require_relative "lib/ruby_ares/version"

Gem::Specification.new do |spec|
  spec.name = "ruby_ares"
  spec.version = RubyAres::VERSION
  spec.authors = ["Tomáš Král"]
  spec.email = ["tomas.kral@railsformers.com"]

  spec.summary = "Ruby library for fetch Czech companies data from ARES."
  spec.description = "This library is used to fetch company data from ARES, sucha as name, address, etc."
  spec.homepage = "https://github.com/railsformers/ruby_ares"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.0.0"

  # spec.metadata["allowed_push_host"] = ""

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/railsformers/ruby_ares"
  spec.metadata["changelog_uri"] = "https://github.com/railsformers/ruby_ares/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "ostruct"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
