class Plan < ActiveRecord::Base
  belongs_to :user
  has_many :destinations
  has_many :spots, :through => :destinations
end
