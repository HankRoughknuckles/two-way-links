require 'resque'
require 'workers/single_page_scraper'

require 'mechanize'

class Api::V1::CrawlersController < ActionController::API
  def create
    resource = Resource.find_or_create_by_url(params[:target_url])
    Resque.enqueue(SinglePageScraper, resource.id)
  end
end
