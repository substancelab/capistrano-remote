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
