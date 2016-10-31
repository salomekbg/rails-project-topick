class StatisticsController < ApplicationController
  def index
    find_user_by_session_id
    @rooms = Room.all
    columns = <<-SQL
      SELECT topics.*
      FROM topics
      -- JOIN rooms
      -- ON topics.id = rooms.topic_id
      -- GROUP BY topics.id
    SQL

    topic_array = Topic.find_by_sql(columns)
    @topic_names = topic_array.map {|topic_object| [topic_object[:name], topic_object.rooms.length]}

    bar = <<-SQL
      SELECT rooms.*
      FROM rooms
    SQL

    room_array = Room.find_by_sql(bar)
    @room_users = room_array.map {|room_object| [room_object[:name], room_object.users.length]}
  end
end
