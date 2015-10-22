class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :author
      t.string :name
      t.string :category
      t.datetime :date
      t.integer :rating

      t.timestamps
    end
  end
end
