require 'workers/single_page_scraper'

class Resource < ApplicationRecord
  belongs_to :website

  has_many :links_as_subscriber, class_name: 'Link', foreign_key: :subscriber_id
  has_many :targets, through: :links_as_subscriber

  has_many :links_as_target, class_name: 'Link', foreign_key: :target_id
  has_many :subscribers, through: :links_as_target

  before_validation do
    self.website = Website.find_or_create_by_url(self.url)
  end

  class << self
    def find_or_create_by_url(url)
      self.find_or_create_by(url: url)
    end
  end

  def create_target_link_to(target)
    link = Link.find_by(subscriber: self, target: target)
    return false if link.present?

    self.targets << target
    return true
  end

  def register_links(links)
    links.each do |link|
      target = Resource.find_by(url: link)
      if target.present?
        self.create_target_link_to(target)
      else
        target = Resource.create(url: link)
        self.create_target_link_to(target)
        Resque.enqueue(SinglePageScraper, target.id)
      end
    end
  end
end
