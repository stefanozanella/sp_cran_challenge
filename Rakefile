# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :test do
  desc "Run the end-to-end test suite"
  Rake::TestTask.new :end_to_end do |t|
    t.libs << 'lib'
    t.libs << 'test'
    t.pattern = "test/end_to_end/**/*.rb"
    t.verbose = true
  end
end

require 'spider'
desc "Crawls the CRAN website to update the list of packages"
task :crawl => :environment do
  CranCrawler::Spider.new.crawl
end
