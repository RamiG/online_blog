class UsersController < ApplicationController

  def show
    @user = User.find_by_id(params[:id])    
    @posts = @user.posts.order('created_at desc').paginate(page: params[:page], per_page: 5)
  end

end
