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
    page = Mechanize.new.get(resource.url)

    logger.info("==================================");
    logger.info("Resource: #{resource.url}");
    page.links.each do |link|
      target = Resource.find_or_create_by_url(link.href)
      was_created = resource.create_target_link_to(target)

      if was_created
        logger.info("    => #{link.href}");
      else
        logger.info("    => #{link.href} - already present");
      end
      # enqueue(target.id)
    end
    end_time = Time.now

    logger.info("started: #{start_time}, ended: #{end_time} - #{(end_time - start_time) * 1000.0}ms")
  end

end
