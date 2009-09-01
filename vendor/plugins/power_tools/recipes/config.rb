namespace :config do

  # Setup a directory for RAILS_ENV specific configuration files.
  desc "Add config files"
  task :setup, :roles => [:app] do
    run "mkdir -p #{shared_path}/config"
    run "touch #{shared_path}/config/database.yml"
    if fetch(:mongrel_conf, nil)
      run "touch #{shared_path}/config/mongrel_cluster.yml"
    end
  end
  after "deploy:setup", "config:setup"
  
  # Copy RAILS_ENV specific configuration files on new deploy
  desc "Update config files"
  task :update, :roles => [:app] do
    run "cp -Rf #{shared_path}/config #{release_path}"
  end
  after "deploy:update_code", "config:update"

end
