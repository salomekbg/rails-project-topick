class StatisticsController < ApplicationController
  def index
    find_user_by_session_id
    @rooms = Room.all
    sql = <<-SQL
      SELECT name
      FROM topics
      JOIN rooms
      ON topic.id = rooms.topic_id
      GROUP BY topics.id
    SQL
    puts "hi"
  end
end
