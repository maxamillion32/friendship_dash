# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

require "capistrano/bundler"
require "capistrano/rails/assets"
require "capistrano/rails/migrations"
require "capistrano/maintenance"

require "capistrano/rvm"

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
