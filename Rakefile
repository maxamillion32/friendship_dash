# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be
# available to Rake.

require File.expand_path("../config/application", __FILE__)

Rails.application.load_tasks

if Rails.env.test? || Rails.env.development?
  require "rubocop/rake_task"

  RuboCop::RakeTask.new

  task :default do
    Rake::Task["rubocop"].invoke
    dir = File.dirname(__FILE__)
    puts `#{ File.join(dir, "bin", "brakeman") } #{ File.join(dir, ".") }`
  end
end
