class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id, :null=>false, :index=>true
      t.integer :photo_id, :null=>false, :index=>true
      t.timestamps null: false
    end
  add_index :likes, [:photo_id, :user_id], :unique => true
  add_column :photos, :likes_count, :integer, :default =>0

  end

end
