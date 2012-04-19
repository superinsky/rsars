require 'bundler/capistrano'


set :application, "rsars"

set :branch, "master"
set :repository,  "git@github.com:superinsky/rsars.git"
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, "mapp"
set :use_sudo, false
set :deploy_to, "/var/www/#{application}"
# set :applicationdir, "home/#{user}/#{application}"
# # set :deploy_to, applicationdir

#set :deploy_via, :remote_cache

role :web, "172.16.168.129"                          # Your HTTP server, Apache/etc
role :app, "172.16.168.129"                          # This may be the same as your `Web` server
role :db,  "172.16.168.129", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

after "deploy", "deploy:bundle_gems"
after "deploy:bundle_gems", "deploy:restart"

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :bundle_gems do
    run "cd #{deploy_to}/current && bundle install vendor/gems"
  end
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end