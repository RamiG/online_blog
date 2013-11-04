class StaticPagesController < ApplicationController
  def home
    @user = current_user    
    @search = Post.search do 
      fulltext params[:search] do
        highlight :content
      end

      #if params[:q].present?
       # keywords(params[:q]) do
        #  highlight :content
       # end      
      #end
      order_by :created_at, :desc
      paginate(page: params[:page], per_page: 5)
    end
    @posts = @search.results
    #@posts = Post.order("created_at desc").paginate(page: params[:page], per_page: 5)    
  end

  def about
  end
end
