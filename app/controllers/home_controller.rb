class HomeController < ApplicationController
  
  def index
  end
  
  def dev
    if logged_in?
      @new_comment = Comment.new(:commentable => current_user)
    end
    @comments = Comment.order('created_at DESC')
  end

end
