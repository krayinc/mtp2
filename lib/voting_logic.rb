module VotingLogic
  module Votable
    def self.included(base)
      base.extend ClassMethods
    end
    module ClassMethods
      def logic_for_votable(options={})
        has_many :votings, {:as => :votable, :dependent => :destroy}
        include VotingLogic::Votable::InstanceMethods
        extend VotingLogic::Votable::SingletonMethods
      end
    end
    module InstanceMethods
      def vote!(user_or_userid)
        self.votings.create(:votable => self, :user_id => get_user_id(user_or_userid) )
      end

      def unvote!(user_or_userid)
        if self.voted_by?(user_or_userid)
          voting = self.votings.where(:user_id => user_or_userid).first
          voting.destroy if voting
        end
      end

      def total_votes
        self.votings.count
      end

      def voted_by?(user_or_userid)
        self.votings.exists?(['user_id = ?', get_user_id(user_or_userid)])
      end
      protected
        def get_user_id(user_or_userid)
          if user_or_userid.kind_of?(User)
            user_id = user_or_userid.id
          elsif user_or_userid.kind_of?(Integer)
            user_id = user_or_userid
          end
        end
    end
    module SingletonMethods
    end
  end
end
ActiveRecord::Base.send(:include, VotingLogic::Votable)