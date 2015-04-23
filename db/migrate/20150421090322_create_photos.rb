class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer  :user_id
      t.string   :description
      t.string   :photo_file_name
      t.string   :photo_content_type
      t.integer  :photo_file_size
      t.datetime :photo_updated_at
      t.timestamps null: false
    end
    add_index :photos, :user_id
  end
end
