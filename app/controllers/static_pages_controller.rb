class StaticPagesController < ApplicationController
  def home
    @user = current_user    
    @posts = Post.paginate(page: params[:page], per_page: 5)    
  end

  def about
  end
end
