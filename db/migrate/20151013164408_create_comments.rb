class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column :author, :string
      t.column :body, :string
      t.column :post_id, :integer
      # t.references :post, index: true, foreign_key: true

      t.timestamps
    end
  end
end
