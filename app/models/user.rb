class User < TwitterAuth::GenericUser
  logic_for_rankable
  has_many :plans
  has_many :photos, :class_name => 'SpotPhoto', :dependent => :destroy
  scope :popluar, order_by_rank
  def calculate_point(time_range)
    votings_count = self.plans.from('plans, votings').where(%{votings.votable_id = plans.id AND votings.votable_type = 'Plan'}).count
    comments_count = self.plans.from('plans, comments').where(%{comments.commentable_id = plans.id AND comments.commentable_type = 'Plan'}).count
    return (votings_count * 2) + (comments_count * 1)
  end
end

# == Schema Information
#
# Table name: users
#
#  id                           :integer         not null, primary key
#  twitter_id                   :string(255)
#  login                        :string(255)
#  access_token                 :string(255)
#  access_secret                :string(255)
#  remember_token               :string(255)
#  remember_token_expires_at    :datetime
#  name                         :string(255)
#  location                     :string(255)
#  description                  :string(255)
#  profile_image_url            :string(255)
#  url                          :string(255)
#  protected                    :boolean
#  profile_background_color     :string(255)
#  profile_sidebar_fill_color   :string(255)
#  profile_link_color           :string(255)
#  profile_sidebar_border_color :string(255)
#  profile_text_color           :string(255)
#  profile_background_image_url :string(255)
#  profile_background_tile      :boolean
#  friends_count                :integer
#  statuses_count               :integer
#  followers_count              :integer
#  favourites_count             :integer
#  utc_offset                   :integer
#  time_zone                    :string(255)
#  created_at                   :datetime
#  updated_at                   :datetime
#

