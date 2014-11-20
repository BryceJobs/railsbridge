class RepliesController < ApplicationController
  before_action :set_post
  
  def create
  	@reply = Reply.new(reply_params)
  	@reply.post = @post
  	@reply.user = current_user

  	if @reply.save
  		redirect_to show_post_path(@post), notice: 'the reply have been added'
  	else
      #@replies = @post.replies
  		redirect_to show_post_path(@post), alert: 'cannot create empty reply. fill the content field'
  	end
  end

  def destroy
    Reply.find(params[:id]).destroy
    redirect_to show_post_path @post, notice: 'the reply has been deleted'
  end

  private

  def set_post
  	@post = Post.find(params[:post_id])
  end

  def reply_params
  	params.require(:reply).permit(:content)
  end

end
