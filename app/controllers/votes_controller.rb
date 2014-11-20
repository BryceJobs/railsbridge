class VotesController < ApplicationController
	before_action :set_post
	before_action :authenticate_user!

	def vote_up
		@vote = Vote.new()
		@vote.user = current_user
		@vote.post = @post
		@vote.vote = 1

		if @vote.save
			redirect_to show_all_posts_path, notice: 'Thank you for voting, your voice matter to us'
		end
	end
	def vote_down
		@vote = Vote.new()
		@vote.user = current_user
		@vote.post = @post
		@vote.vote = -1

		if @vote.save
			redirect_to show_all_posts_path, notice: 'Thank you for voting, your voice matter to us'
		end
	end

	private

	def set_post
		@post = Post.find(params[:post_id])
	end

end