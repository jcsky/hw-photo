class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id, :null => false, :index => true
      t.integer :photo_id, :null => false, :index => true
      t.timestamps null: false
    end

    add_index :subscriptions, [:photo_id, :user_id], :unique => true
  end

end
