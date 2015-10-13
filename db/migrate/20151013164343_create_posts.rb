class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.column :author, :string
      t.column :title, :string
      t.column :link, :string
      t.column :votes, :integer
      t.column :score, :integer

      t.timestamps
    end
  end
end
