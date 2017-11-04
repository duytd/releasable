namespace :releasable do
  task install: :environment do
    Rake::Task["releasable:install:migrations"].invoke
  end
end
