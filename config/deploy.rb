set :application, "asset_tracker"
set :repository,  "git@github.com:preston/asset_tracker.git"
set :scm, "git"
set :deploy_via, :copy
set :branch, "master"

set :passenger_conf, true

set :domain, "calypso.openrain.com"

role :app, domain
role :web, domain
role :db,  domain, :primary => true
set :user, "app" # Login as?
set :runner, "app" # Run ./script as?
set :use_sudo, false

set :rails_env, "production"
set :deploy_to, "/var/local/assets.openrain.com"

# Symlink database
desc "Symlink database file"
task :symlink_db, :roles => [:db] do
  run "ln -s #{shared_path}/db/production.sqlite3 #{release_path}/db/production.sqlite3"
end
after "deploy:update_code", "symlink_db"
