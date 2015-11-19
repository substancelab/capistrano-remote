namespace :remote do
  desc "Run and attach to a remote Rails console"
  task :console do
    rails_env = fetch(:rails_env)
    on roles(:db) do |host|
      Capistrano::Remote::Runner.new.run_interactively(
        "console #{rails_env}",
        host
      )
    end
  end

  desc "Run and attach to a remote Rails database console"
  task :dbconsole do
    rails_env = fetch(:rails_env)
    on roles(:db) do |host|
      Capistrano::Remote::Runner.new.run_interactively(
        "dbconsole #{rails_env} -p",
        host
      )
    end
  end
end

module Capistrano
  module Remote
    class Runner
      def run_interactively(command, host)
        remote_command = "cd #{current_path} && #{bundle_command} exec rails #{command}"

        user = fetch(:user, host.user)
        local_command = "ssh -l #{user} #{host.hostname} -t \"#{remote_command}\""
        exec local_command
      end

      private

      def bundle_command
        fetch(:bundle_command, SSHKit.config.command_map[:bundle])
      end
    end
  end
end
