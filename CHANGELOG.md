# Change Log

All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## Unreleased

### Added

- Compatibility with Rails 7+. We no longer pass the environment to dbconsole in a deprecated way. (@glaszig)

### Changed

- Requirements for Bundler versions have been relaxed. We should work just fine on 10.0 and forward as we have done since the beginning of the project.

- Requirements for Rake versions have been relaxed. We should work just fine on 1.17 and forward as we have done since the beginning of the project.

## [0.3.0] - 2019-09-25

### Added

- cap remote:console is now ready for Rails 6. (@ifsc01)

## [0.2.1] - 2018-02-13

### Fixed

- We no longer construct a faulty local command when the SSH username isn't set
- Ensure we shellescape the remote command to prevent issues when it contains special characters, like references to ENV variables.

## [0.2.0] - 2016-02-15

### Added

- A changelog (this one)
- Support for running rake tasks remotely: `cap remote:rake task=about`

## [0.1.0]

### Added

- Support for running rails console remotely
- Support for running rails dbconsole remotely
