class HomeController < ApplicationController
  
  def index
    @plans = Plan.popluar.limit(4)
    @hot_users = User.popluar.limit(10)
  end
  
  def dev
    if logged_in?
      @new_comment = Comment.new(:commentable => current_user)
    end
    @comments = Comment.order('created_at DESC')
  end

end
