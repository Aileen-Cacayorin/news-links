class Post < ActiveRecord::Base
  has_many :comments
  before_validation :default_values

  def default_values
    self.votes ||= 0
    self.score ||= 10
  end

  validates_presence_of :author, :title, :link, :votes, :score
end
