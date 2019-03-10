require 'mechanize'

def scraper_logger
  Logger.new(Rails.root.join('log/scraper.log'), File::APPEND)
end

class SinglePageScraper
  @queue = :crawler_queue

  def self.perform(resource_id)
    start_time = Time.now
    logger = scraper_logger
    resource = Resource.find(resource_id)
    link_hrefs = Mechanize.new.get(resource.url).links.map { |link| link.href }

    logger.info("==================================");
    logger.info("Resource: #{resource.url}");

    logger.info(link_hrefs)
    resource.register_links(link_hrefs)

    logger.info("Took #{(Time.now - start_time) * 1000.0}ms")
  end
end
