require 'resque'
require 'workers/single_page_scraper'

class Api::V1::CrawlersController < ActionController::API
  def create
    puts params[:target_url]
    puts 'in the post action!'
    Resque.enqueue(SinglePageScraper, params[:target_url])
  end
end
