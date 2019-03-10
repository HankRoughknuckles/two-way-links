class Resource < ApplicationRecord
  belongs_to :website

  has_many :links_as_subscriber, class_name: 'Link', foreign_key: :subscriber_id
  has_many :targets, through: :links_as_subscriber

  has_many :links_as_target, class_name: 'Link', foreign_key: :target_id
  has_many :subscribers, through: :links_as_target

  class << self
    def find_or_create_by_url(url)
      website = Website.find_or_create_by_url(url)
      self.find_or_create_by(website_id: website.id, url: url)
    end
  end

  def create_target_link_to(target)
    link = Link.find_by(subscriber: self, target: target)
    return false if link.present?

    self.targets << target
    return true
  end
end
