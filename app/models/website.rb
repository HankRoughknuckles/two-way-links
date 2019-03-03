class Website < ApplicationRecord
  has_many :resources

  class << self
    def get_domain_and_suffix(url)
      parsed = Domainatrix.parse(url)
      "#{parsed.domain}.#{parsed.public_suffix}"
    end

    def find_or_create_by_url(url)
      self.find_or_create_by(domain_and_suffix: self.get_domain_and_suffix(url))
    end
  end
end
