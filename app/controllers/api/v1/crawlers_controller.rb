require 'resque'
require 'workers/single_page_scraper'

require 'mechanize'

class Api::V1::CrawlersController < ActionController::API
  def create
    # Resque.enqueue(SinglePageScraper, params[:target_url])

    agent = Mechanize.new
    page = agent.get('https://medium.com/s/story/the-inevitability-of-apples-current-predicament-e946c1c90ba8')
    page.links.each do |link|
      puts "link = #{link.href} = #{link.text}"
    end
  end
end
