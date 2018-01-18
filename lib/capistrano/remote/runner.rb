module Capistrano
  module Remote # :nodoc:
    # The primary interface for actually running tasks on a remote host.
    class Runner
      attr_reader :host

      def initialize(host)
        @host = host
      end

      def rake(task)
        run_interactively(in_current_path(rake_command(task)))
      end

      def rails(command)
        run_interactively(in_current_path(rails_command(command)))
      end

      private

      def bundle_command
        fetch(:bundle_command, SSHKit.config.command_map[:bundle])
      end

      def hostname
        host.hostname
      end

      def in_current_path(command)
        "cd #{current_path} && #{command}"
      end

      def rails_command(command)
        "#{bundle_command} exec rails #{command}"
      end

      def rake_command(arguments)
        command = fetch(:rake_command, SSHKit.config.command_map[:rake])
        "#{command} #{arguments}"
      end

      def run_interactively(remote_command)
        parts = [
          'ssh',
          (user ? "-l #{user}" : nil),
          hostname,
          "-t \"#{remote_command}\""
        ]
        local_command = parts.compact.join(' ')
        exec local_command
      end

      def user
        fetch(:user, host.user)
      end
    end
  end
end
