require 'resque'
require 'workers/single_page_scraper'

require 'mechanize'

class Api::V1::CrawlersController < ActionController::API
  def create
    # Resque.enqueue(SinglePageScraper, params[:target_url])

    resource = Resource.find_or_create_by_url(params[:target_url])

    scrape_starting_with(resource.id)
  end

  def scrape_starting_with(resource_id)
    resource = Resource.find(resource_id)
    # agent = Mechanize.new.agent
    page = Mechanize.new.get(resource.url)
    page.links.each do |link|
      puts "link = #{link.href} = #{link.text}"
      resource = Resource.find_or_create_by_url(link.href)
      resource.increment_reference_count

      # enqueue(resource.id)

      # Register that destination in the db
      # Make the resource that’s being targeted as a resource on the website
      # Register the source page in the target as being one of the “subscribers"
    end
  end
end
