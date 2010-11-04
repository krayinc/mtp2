class SpotPhoto < ActiveRecord::Base
  belongs_to :user
  belongs_to :spot

  if Rails.env.production?
    has_attached_file :photo,
      :storage => :s3,
      :s3_credentials => {
        :access_key_id => ENV['S3_KEY'],
        :secret_access_key => ENV['S3_SECRET'],
      },
      :bucket => ENV['S3_BUCKET'],
      :path   => "/spot/photos/:hashed_name/:style.:extension",
      :url    => "/spot/photos/:hashed_name/:style.:extension",
      :styles => {
        :list        => '45x45#',
        :plan        => '90x90#',
        :destination => '56x56#',
      }
  else
    has_attached_file :photo,
      :path => ":rails_root/public/images/upload/spot_photos/:hashed_name/:style.:extension",
      :url => "/images/upload/spot_photos/:hashed_name/:style.:extension",
      :styles => {
        :list        => '45x45#',
        :plan        => '90x90#',
        :destination => '56x56#',
      }
  end
end
