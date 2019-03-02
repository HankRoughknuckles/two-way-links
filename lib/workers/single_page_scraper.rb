require 'mechanize'

class SinglePageScraper
  @queue = :crawler_queue

  def self.perform(target_url)
    puts "in the scraper! - goign to scrape that #{target_url}"
    # agent = Mechanize.new
    # page = agent.get('https://medium.com/s/story/the-inevitability-of-apples-current-predicament-e946c1c90ba8')
    # page.links.each do |link|
    #   puts "link = #{link.href} = #{link.text}"
    # end
  end
end
