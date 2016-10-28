class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def create
		room = Room.find(session[:room_id])
		membership = Membership.find_by(user_id: session[:user_id], room_id: room.id)
		post = Post.new(content: params[:post][:content], membership_id: membership.id)
		post.save
		redirect_to room
	end

	def destroy
		room = Room.find(session[:room_id])
		post = room.posts.find(params[:id])
		post.delete
		redirect_to room
	end
end
