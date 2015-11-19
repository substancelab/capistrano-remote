namespace :remote do
  desc "Run and attach to a remote Rails console"
  task :console do
    rails_env = fetch(:rails_env)
    on roles(:db) do |host|
      Capistrano::Remote::Runner.new(host).run_interactively(
        "console #{rails_env}"
      )
    end
  end

  desc "Run and attach to a remote Rails database console"
  task :dbconsole do
    rails_env = fetch(:rails_env)
    on roles(:db) do |host|
      Capistrano::Remote::Runner.new(host).run_interactively(
        "dbconsole #{rails_env} -p"
      )
    end
  end
end

module Capistrano
  module Remote
    class Runner
      attr_reader :host

      def initialize(host)
        @host = host
      end

      def run_interactively(command)
        remote_command = "cd #{current_path} && #{bundle_command} exec rails #{command}"
        local_command = "ssh -l #{user} #{hostname} -t \"#{remote_command}\""
        exec local_command
      end

      private

      def bundle_command
        fetch(:bundle_command, SSHKit.config.command_map[:bundle])
      end

      def hostname
        host.hostname
      end

      def user
        fetch(:user, host.user)
      end
    end
  end
end
