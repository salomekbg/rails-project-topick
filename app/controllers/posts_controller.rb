class PostsController < ApplicationController
	def new
		@post = Post.new
	end

	def create
		@room = Room.find(session[:room_id])
		membership = Membership.find_by(user_id: session[:user_id], room_id: @room.id)
		post = Post.new(content: params[:post][:content], membership_id: membership.id)
		post_limit = PostLimit.new(find_user_by_session_id)
		if post_limit.post_max?
			@room.errors[:base] << "You can only post 5 times per day"
			render :'rooms/show'
		else
			post.save
			redirect_to @room
		end
	end

	def destroy
		@room = Room.find(session[:room_id])
		post = @room.posts.find(params[:id])
		post.delete
		redirect_to @room
	end
end
