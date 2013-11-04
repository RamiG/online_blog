class CommentsController < ApplicationController

  def create  
    @post = Post.find(params[:comment][:post_id])
    @comment = @post.comments.build(comment_params)

    unless user_signed_in?
      @comment.valid?
      if verify_recaptcha() && @comment.save
        flash[:success] = 'Comment added!'  
      else
        flash.now[:error] = "Enter coorect captcha text"
      end
    else 
      if @comment.save      
        flash[:success] = 'Comment added!'      
      else
        flash.now[:error] = "Error adding comment: #{@comment.errors}"
      end
    end  
    redirect_to @post
  end

  def destroy
    Comment.find(params[:id]).destroy    
    redirect_to @comment.post
  end

  private
    def comment_params
      params.require(:comment).permit(:comment_text, :user_id, :post_id)
    end

end