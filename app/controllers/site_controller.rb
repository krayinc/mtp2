class SiteController < ApplicationController
  
  def index
    @pickup = Plan.pickup
    @news = News.published.limit(3)
    @popular_plans = Plan.popular.limit(4)
    @hot_users = User.popular.limit(10)
  end
  
  def dev
    if logged_in?
      @new_comment = Comment.new(:commentable => current_user)
    end
    @comments = Comment.order('created_at DESC')
  end

end
