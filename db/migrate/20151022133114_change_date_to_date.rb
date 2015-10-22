class ChangeDateToDate < ActiveRecord::Migration
  def change
    change_column :posts, :date, :date
  end
end
