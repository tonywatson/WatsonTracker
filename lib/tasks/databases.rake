namespace :db do
  desc "Drops all local databases, recreates and re-runs migrations on them"
  task :remigrate => [:drop, :create, :migrate, :seed]
end