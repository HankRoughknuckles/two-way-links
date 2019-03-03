class Resource < ApplicationRecord
  belongs_to :website

  class << self
    def find_or_create_by_url(url)
      website = Website.upsert(url)
      self.find_or_create_by(website_id: website.id, url: url)
    end
  end
end
