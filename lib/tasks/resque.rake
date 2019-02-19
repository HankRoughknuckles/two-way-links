require 'resque/tasks'
require 'workers/single_page_scraper'

task 'resque:setup' => :environment
