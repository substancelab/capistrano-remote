lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/remote/version'

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-remote'
  spec.version       = Capistrano::Remote::VERSION
  spec.authors       = ['Jakob Skjerning']
  spec.email         = ['jakob@mentalized.net']

  spec.summary = \
    'Capistrano tasks to start a Rails console or dbconsole on your servers'
  spec.description = <<-DESCRIPTION
    Every so often you need to look at your production data or otherwise run
    some manual maintenance tasks in your production Rails application.

    This gem adds tasks to Capistrano that lets you start a Rails console or
    dbconsole on your servers without manually SSH'ing.
  DESCRIPTION

  spec.homepage      = 'https://github.com/substancelab/capistrano-remote'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f|
    f.match(%r{^(test|spec|features)/})
  }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano', '~> 3.0'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 12.3'
end
