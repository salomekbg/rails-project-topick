class RoomRecs
  attr_accessor :room

  def initialize(room)
    @room = room
  end

  def find_rooms
  @hash = Hash.new(0)
  @room.current_members.map do |user|
  	user.rooms.map do |room|
  		room
	  	end
	  end
	end

  def rank_rooms
  	find_rooms.flatten.each do |room_object|
  	@hash[room_object]+=1
  	end
  	@hash
  end

  def sort_rooms
  	rank_rooms.sort_by{|k, v| v}
  end
  
  def recommend
  	room_rec = sort_rooms.last
  	if @room.name == room_rec.first.name
  		room_rec = sort_rooms[-2]
  	end
  	room_rec
  end
 


end
