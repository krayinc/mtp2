class News < ActiveRecord::Base
  normalize_attribute :title, :with => [:half_width, :strip, :blank]
  normalize_attribute :body,  :with => [:half_width, :strip, :blank]

  validates :title,        :presence => true
  validates :body,         :presence => true
  validates :published_at, :presence => true

  scope :published, lambda{ where('published_at <= ?', Time.now) }
end
