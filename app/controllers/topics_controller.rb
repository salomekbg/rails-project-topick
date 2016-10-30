class TopicsController < ApplicationController
	def index
		@topics = Topic.all
		find_user_by_session_id
	end
end
