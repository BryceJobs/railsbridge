class PostController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
      @posts = User.find(current_user).posts 
  end

  def all
    @posts = Post.all
  end

  def show
    @replies = @post.replies
  end

  def new
  	# current_user.create
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
  	if @post.save
  		redirect_to root_path, notice: 'the post was created'
  	else
  		render 'new', alert: 'couldn\'t save the post'
  	end
  end

  def edit  
  end

  def update
    if @post.update(post_params)
      redirect_to show_post_path(@post), notice: 'the post has been updated successfully'
    else
      render 'edit', alert: 'error has occured, check the form'
    end
  end

  def destroy
    if @post.destroy
      redirect_to show_all_posts_path, notice: 'the post has been deleted'
    else
      flash[:alert] = "the post cannot be deleted"
      render 'all'
    end
  end

  private

  def set_post
  	@post = Post.find(params[:id])
  end

  def post_params
  	params.require(:post).permit(:title, :content)
  end
end
