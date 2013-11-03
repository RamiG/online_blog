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


  def categorized
    if params[:category].present?
      #@posts = Post.find_by_category_id(params[:category]).paginate(page: params[:page], per_page: 5)
      @posts = Post.all.where("category_id = #{params[:category].to_i}").paginate(page: params[:page], per_page: 5)
    else      
      @posts = nil
    end
    @filter = "category: " + Category.find(params[:category]).name
  end

  def tagged
    if params[:tag].present?
      @posts = Post.tagged_with(params[:tag]).paginate(page: params[:page], per_page: 5)
    else      
      @posts = nil
    end
    @filter = "tag: " + params[:tag]
  end

  private
  
    def define_user
      @user = current_user
    end

    def post_params
      params.require(:post).permit(:title, :content, :category_id, :tag_list)
    end

end
