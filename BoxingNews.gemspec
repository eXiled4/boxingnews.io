# frozen_string_literal: true

require_relative "lib/BoxingNews/version"

Gem::Specification.new do |spec|
  spec.name = "BoxingNews"
  spec.version = BoxingNews::VERSION
  spec.authors = ["braum852"]
  spec.email = ["julian.teo59@yahoo.com"]

  spec.summary = "Latest Boxing News"
  spec.homepage = "https://github.com/braum852/boxing.io"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://github.com/braum852/boxing.io'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/braum852/boxing.io"
  spec.metadata["changelog_uri"] = "https://github.com/braum852/boxing.io"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  
  spec.add_dependency "nokogiri"
end
