class Ranking < ActiveRecord::Base
  
  DEFAULT_RANGE = 7.days
  
  belongs_to :rankable, :polymorphic => true
  validates_presence_of :rankable
  validates_numericality_of :point, :range
  
  def self.update(rankable, range = 1.weeks)
    logger.info "target:#{rankable} range:#{range}"
    begin
      klass = rankable.constantize
      if klass.rankable?
        Ranking.where(:rankable_type => rankable, :range => range).delete_all
        klass.find_each do |instance|
          ranking = Ranking.create :rankable => instance, 
                         :range => range, 
                         :point => instance.calculate_point((range.ago)..(Time.now))
          p ranking
        end
      end
    rescue => e
      logger.info e
    end
  end
end
