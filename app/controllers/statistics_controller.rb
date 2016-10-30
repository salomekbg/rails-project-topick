class StatisticsController < ApplicationController
  def index
    find_user_by_session_id
  end
end
