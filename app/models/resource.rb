class Resource < ApplicationRecord
  belongs_to :website

  class << self
    def find_or_create_by_url(url)
      parsed = Domainatrix.parse(url)
      website = Website.upsert(url)
      self.find_or_create_by(website_id: website.id, path: parsed.path, url: url)
    end
  end

  def increment_reference_count
    self.reference_count += 1
    self.save
  end
end
