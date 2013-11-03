class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :destroy, :create, :edit, :update]
  before_action :define_user

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post created!'
      redirect_to user_path(@user)
    else
      @posts = []
      render 'new'      
    end    
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post deleted."
    redirect_to :back    
  end

  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new(user_id: @user.id)
  end

  def show
    @post = Post.find(params[:id])    
    @comment = Comment.new(post: @post, user: @user)
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)     
      flash[:succes] = "Post updated"
      redirect_to @post.user
    else
      render 'edit'
    end    
  end

  private
  
    def define_user
      @user = current_user
    end

    def post_params
      params.require(:post).permit(:title, :content, :tag_list)
    end

end
