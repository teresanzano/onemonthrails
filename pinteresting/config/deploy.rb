require 'bundler/capistrano'
require "rvm/capistrano"

# staging
set :stages, ["staging", "production"]
set :default_stage, "staging"


set :application, "Pinteresting"
set :repository,  "git@github.com:teresanzano/onemonthrails.git"

role :web, "162.243.236.170"                 
role :app, "162.243.236.170"                        
role :db,  "162.243.236.170", :primary => true 

set :user, "rails"
set :password, "ObmRVx8rSV"

set :use_sudo, false
set :deploy_to, "/home/rails/"
set :deploy_via, :copy

set :normalize_asset_timestamps, false

set :rvm_type, :system
namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end
