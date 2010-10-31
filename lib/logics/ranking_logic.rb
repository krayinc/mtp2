module RankingLogic
  module Rankable
    def self.included(base)
      base.extend ClassMethods
    end
    module ClassMethods
      def logic_for_rankable(options={})
        has_many :rankings, {:as => :rankable, :dependent => :destroy}
        include RankingLogic::Rankable::InstanceMethods
        extend RankingLogic::Rankable::SingletonMethods
      end
    end
    module InstanceMethods
      # TODO orberride in your class
      def calculate_point(time_range)
        return 0
      end
    end
    module SingletonMethods
      def rankable?
        true
      end
      def order_by_rank(options = {})
        select(%{*, rankings.point, #{self.table_name}.id AS id}).
          joins(%{INNER JOIN rankings ON rankings.rankable_id = #{self.table_name}.id AND rankings.rankable_type = '#{self.to_s}' AND rankings.range = 604800}).
          order('rankings.point DESC')
      end
    end
  end
end
ActiveRecord::Base.send(:include, RankingLogic::Rankable)