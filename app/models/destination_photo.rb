class DestinationPhoto < ActiveRecord::Base
  belongs_to :destination
  belongs_to :photo, :class_name => 'SpotPhoto', :foreign_key => 'photo_id'
end
