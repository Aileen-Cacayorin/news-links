class SetDefaultValuesPosts < ActiveRecord::Migration
  def change
    change_column :posts, :votes, :integer, default: 0
    change_column :posts, :score, :integer, default: 10
  end
end
