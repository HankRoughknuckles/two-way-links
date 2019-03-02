class Website < ApplicationRecord
  has_many :resources

  class << self
    # TODO: rename this and have it take a string
    def get_truncated_url(parsed)
      "#{parsed.domain}.#{parsed.public_suffix}"
    end

    # TODO: replace with find_or_create_by
    def upsert(url)
      parsed = Domainatrix.parse(url)
      website = self.find_by(domain_and_suffix: self.get_truncated_url(parsed))
      return website if website.present?
      return self.create(domain_and_suffix: self.get_truncated_url(parsed))
    end
  end

  # def find_or_create_by(options)
  #   website = self.find_by(domain: options[:domain])
  #   return website if website
  # end
end
