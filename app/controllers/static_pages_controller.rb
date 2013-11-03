class StaticPagesController < ApplicationController
  def home
    @user = current_user    
    @posts = Post.order("created_at desc").paginate(page: params[:page], per_page: 5)    
  end

  def about
  end
end
