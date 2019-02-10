class SinglePageScraper
  @queue = :crawler_queue

  def self.perform(target_url)
    puts "in the scraper! - goign to scrape that #{target_url}"
  end
end
