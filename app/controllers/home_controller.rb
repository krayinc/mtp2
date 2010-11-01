class HomeController < ApplicationController
  
  def index
    @plans = Plan.order('created_at DESC').limit(4)
  end
  
  def dev
    if logged_in?
      @new_comment = Comment.new(:commentable => current_user)
    end
    @comments = Comment.order('created_at DESC')
  end

end
