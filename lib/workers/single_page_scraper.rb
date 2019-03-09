require 'mechanize'

class SinglePageScraper
  @queue = :crawler_queue

  # def self.perform(target_url)
  #   resource = Resource.find(resource_id)
  #   page = Mechanize.new.get(resource.url)
  #   page.links.each do |link|
  #     puts "link = #{link.href} = #{link.text}"
  #     resource = Resource.find_or_create_by_url(link.href)
  #   end
  # end

end
