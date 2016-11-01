class PostLimit
  attr_reader :user_id
  def initialize(user)
    @user = user
  end

  def current_day
    DateTime.now.day
  end

  def post_counter
      @user.posts.select do |post|
      post.created_at.day == current_day
    end.count
  end

  def post_max?
    true unless self.post_counter < 25
  end





end
