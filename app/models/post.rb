class Post < ActiveRecord::Base
  has_many :comments

  validates_presence_of :author, :title, :link, :votes, :score
end
