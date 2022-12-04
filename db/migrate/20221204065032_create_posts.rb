class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.string :title
      t.string :description
      t.boolean :active_status
      t.string :category

      t.timestamps
    end
  end
end
