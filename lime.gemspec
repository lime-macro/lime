lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'limem/version'

Gem::Specification.new do |spec|
  spec.name          = 'limem'
  spec.version       = Limem::VERSION
  spec.authors       = ['duangsuse']
  spec.email         = ['fedora-opensuse@outlook.com']

  spec.summary       = 'Lime is a tiny object-oriented macro' \
                       ' programming language interpreter'
  spec.description   = 'Lime is a tiny object-oriented macro programming' \
                       " language on Ruby/JVM/etc.\n\nLimem is Ruby " \
                       "implementation to this programming language\n" \
                       "Lime looks like:\n" \
                       '(-> languages (" Ruby Java Scala Kotlin ' \
                       'Rust Haskell Scheme))' \
                       "\n(languages.each (do (l)\n" \
                       '  (puts l)))'

  spec.homepage      = 'https://lime-lang.xyz'
  spec.license       = 'AGPL-3.0'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
