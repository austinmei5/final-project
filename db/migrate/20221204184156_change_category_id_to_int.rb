class ChangeCategoryIdToInt < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :category_id, :integer
  end
end
