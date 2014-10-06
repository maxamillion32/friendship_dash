# config valid only for Capistrano 3.1
lock "3.2.1"

set :application, "friendship_dash"
set :repo_url, "git@github.com:cbitstech/#{ fetch(:application) }.git"
set :rvm_type, :system
set :rvm_ruby_version, "2.1.1"

# Default branch is :master
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

if fetch(:stage) == :staging
  set :deploy_to, "/var/www/apps/#{ fetch(:application) }"
elsif fetch(:stage) == :production
  set :deploy_to, "/var/www/html/src/#{ fetch(:application) }"
end

set :scm, :git
set :format, :pretty
set :log_level, :debug
set :pty, true
set :linked_files, [
  "config/database.yml",
  "config/environments/#{ fetch(:stage) }.rb",
  "config/initializers/devise_secret_token.rb",
  "config/secrets.yml"
]
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

set :keep_releases, 5

namespace :deploy_prepare do

  desc "Configure virtual host"
  task :create_vhost do
    on roles(:web), in: :sequence, wait: 5 do
      staging_vhost_config = <<-EOF
NameVirtualHost *:80
NameVirtualHost *:443

<VirtualHost *:80>
  ServerName friendshipbench-staging.cbits.northwestern.edu
  Redirect permanent / https://friendshipbench-staging.cbits.northwestern.edu/
</VirtualHost>

<VirtualHost *:443>
  PassengerFriendlyErrorPages off
  PassengerAppEnv staging
  PassengerRuby /usr/local/rvm/wrappers/ruby-2.1.1/ruby

  ServerName friendshipbench-staging.cbits.northwestern.edu

  SSLEngine On
  SSLCertificateFile /etc/pki/tls/certs/cbits.northwestern.edu.crt
  SSLCertificateChainFile /etc/pki/tls/certs/cbits.northwestern.edu_intermediate.crt
  SSLCertificateKeyFile /etc/pki/tls/private/cbits.northwestern.edu.key

  DocumentRoot #{ fetch(:deploy_to) }/current/public
  RailsBaseURI /
  PassengerDebugLogFile /var/log/httpd/passenger.log

  <Directory #{ fetch(:deploy_to) }/current/public >
    Allow from all
    Options -MultiViews
  </Directory>
</VirtualHost>
      EOF

#       production_vhost_config = <<-EOF
# NameVirtualHost *:80
# NameVirtualHost *:443

# <VirtualHost *:80>
#   ServerName conemo.northwestern.edu
#   Redirect permanent / https://conemo.northwestern.edu/
# </VirtualHost>

# <VirtualHost *:443>
#   PassengerFriendlyErrorPages off
#   PassengerAppEnv production
#   PassengerRuby /usr/local/rvm/wrappers/ruby-2.1.1/ruby

#   ServerName conemo.northwestern.edu

#   SSLEngine On
#   SSLCertificateFile /etc/pki/tls/certs/cbits-railsapps.nubic.northwestern.edu.crt
#   SSLCertificateChainFile /etc/pki/tls/certs/komodo_intermediate_ca.crt
#   SSLCertificateKeyFile /etc/pki/tls/private/cbits-railsapps.nubic.northwestern.edu.key

#   DocumentRoot #{ fetch(:deploy_to) }/current/public
#   RailsBaseURI /
#   PassengerDebugLogFile /var/log/httpd/passenger.log

#   <Directory #{ fetch(:deploy_to) }/current/public >
#     Allow from all
#     Options -MultiViews
#   </Directory>
# </VirtualHost>
#       EOF

      vhost_config = { staging: staging_vhost_config 
                       # production: production_vhost_config 
                     }

      execute :echo, "\"#{ vhost_config[fetch(:stage)] }\"", ">", "/etc/httpd/conf.d/#{ fetch(:application) }.conf"
    end
  end

  desc "Configure Postgres"
  task :configure_pg do
    on roles(:web), in: :sequence, wait: 5 do
      execute :bundle, "config", "build.pg", "--with-pg-config=/usr/pgsql-9.3/bin/pg_config"
    end
  end

end

namespace :deploy do

  desc "Change deploy dir owner to apache"
  task :set_owner do
    on roles(:web), in: :sequence, wait: 5 do
      execute :sudo, :chgrp, "-R", "apache", fetch(:deploy_to)
    end
  end

  desc "Restart application"
  task :restart do
    on roles(:web), in: :sequence, wait: 5 do
      execute :mkdir, "-p", release_path.join("tmp")
      execute :touch, release_path.join("tmp/restart.txt")
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, "cache:clear"
      # end
    end
  end

end

before "deploy:started", "deploy_prepare:create_vhost"
after "deploy_prepare:create_vhost", "deploy_prepare:configure_pg"
after "deploy_prepare:configure_pg", "deploy:set_owner"
after "bundler:install", "deploy:migrate"
after "deploy:finished", "deploy:restart"
after "deploy:updated", "deploy:cleanup"
