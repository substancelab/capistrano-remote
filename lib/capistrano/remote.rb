require "capistrano/remote/runner"
require "capistrano/remote/version"

# Load the actual tasks
load File.expand_path("tasks/remote.rake", __dir__)
