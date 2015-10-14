class Post < ActiveRecord::Base
  has_many :comments
  before_validation :default_values

  def default_values
    self.votes ||= 0
    self.score ||= 10
  end

  def upvote
    self.votes += 1
    self.score += 1
  end

  def downvote
    self.votes -= 1
    self.score -= 1
  end

  def comment_points
    self.score += 3
  end

  def self.sorted_posts
    se

  end


  validates_presence_of :author, :title, :link, :votes, :score
end
