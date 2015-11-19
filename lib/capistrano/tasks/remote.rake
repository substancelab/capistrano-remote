namespace :remote do
  desc "Run and attach to a remote Rails console"
  task :console do
    rails_env = fetch(:rails_env)
    on roles(:db) do |host|
      run_interactively "bundle exec rails console #{rails_env}", host
    end
  end

  desc "Run and attach to a remote Rails database console"
  task :dbconsole do
    rails_env = fetch(:rails_env)
    on roles(:db) do |host|
      run_interactively "bundle exec rails dbconsole #{rails_env} -p", host
    end
  end
end

def run_interactively(command, host)
  remote_command = "cd #{current_path} && #{command}"

  user = fetch(:user, host.user)

  local_command = "ssh -l #{user} #{host.hostname} -t \"#{remote_command}\""
  exec local_command
end
