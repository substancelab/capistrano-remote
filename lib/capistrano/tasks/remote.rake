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
