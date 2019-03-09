require 'mechanize'

class SinglePageScraper
  @queue = :crawler_queue

  def self.perform(resource_id)
    resource = Resource.find(resource_id)
    page = Mechanize.new.get(resource.url)

    page.links.each do |link|
      puts "link = #{link.href} = #{link.text}"
      target = Resource.find_or_create_by_url(link.href)
      resource.create_target_link_to(target)

      # enqueue(target.id)
    end
  end

end
