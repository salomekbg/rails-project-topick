class FavoriteRoom
	attr_accessor :user

	def initialize(user)
		@user = user
	end

	def users_post_count_in_a_room(room)
		room.memberships.select{|membership| membership.user_id = @user.id}.count
	end



	def favorite_room
  		@user.rooms.sort{|a,b| users_post_count_in_a_room(a) <=> users_post_count_in_a_room(b)}.first
  	end

  	def favorite_room_name
  		favorite_room.name
  	end
 end