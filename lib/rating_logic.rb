module RatingLogic
  module Ratable
    def self.included(base)
      base.extend ClassMethods
    end
    module ClassMethods
      def logic_for_ratable(options={})
        has_many :ratings, {:as => :ratable, :dependent => :destroy}.merge(options)
        include RatingLogic::Ratable::InstanceMethods
        extend RatingLogic::Ratable::SingletonMethods
      end
    end
    module InstanceMethods
      def rate!(score, user_or_user_id)
        rating = Rating.new(:ratable => self)
        rating.user_id = get_user_id(user_or_user_id)
        rating.score = score
        rating.save
      end
      def average_rating
        self.ratings.average(:score) || 0
      end
      def ratings_count
        self.ratings.count
      end
      def rated_by?(user_or_user_id)
        self.ratings.exists?(['user_id = ?', get_user_id(user_or_user_id)])
      end
      protected
        def get_user_id(user_or_user_id)
          if user_or_user_id.kind_of?(User)
            user_id = user_or_user_id.id
          elsif user_or_user_id.kind_of?(Integer)
            user_id = user_or_user_id
          end
        end
    end
    module SingletonMethods
    end
  end
end
ActiveRecord::Base.send(:include, RatingLogic::Ratable)