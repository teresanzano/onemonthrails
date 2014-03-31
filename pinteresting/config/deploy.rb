set :application, 'pinteresting'
set :repo_url, 'git@github.com:teresanzano/onemonthrails.git'

role :web, "162.243.236.170"                 
role :app, "162.243.236.170"                        
role :db,  "162.243.236.170", :primary => true 

set :user, "rails"
set :password, "X54GFxv5h2"

set :use_sudo, false
set :deploy_to, "/home/rails/"
set :deploy_via, :copy

set :normalize_asset_timestamps, false

require 'bundler/capistrano'
require 'bundler/deployment'
set :rvm_type, :system

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# set :deploy_to, '/var/www/my_app'
# set :scm, :git

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

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
