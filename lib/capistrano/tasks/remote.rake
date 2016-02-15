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

  desc "Run a remote rake task. Specify the task to run using the `task` environment variable."
  task :rake do
    rails_env = fetch(:rails_env)
    on roles(:db) do |host|
      Capistrano::Remote::Runner.new(host).rake(
        "RAILS_ENV=#{rails_env} #{ENV['task']}"
      )
    end
  end
end
