class SiteConfig < ActiveRecord::Base
  normalize_attribute :name, :with => [:strip, :blank]
  validates :name, :presence => true, :uniqueness => true

  class << self
    def [](name)
      if (record = self.find_by_name(name))
        record.value
      else
        nil
      end
    end
  end
end
