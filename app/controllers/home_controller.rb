class HomeController < ApplicationController
  
  def index
    @plans = Plan.popular.limit(4)
    @hot_users = User.popular.limit(10)
  end
  
  def dev
    if logged_in?
      @new_comment = Comment.new(:commentable => current_user)
    end
    @comments = Comment.order('created_at DESC')
  end

end
