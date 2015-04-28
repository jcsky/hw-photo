class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, :null => false
      t.integer :user_id, :null => false
      t.integer :photo_id, :null => false
      t.timestamps null: false
    end
    add_column :photos, :comments_count, :integer, :default =>0
  end
end
