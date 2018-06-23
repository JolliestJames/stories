class DropUsers < ActiveRecord::Migration[5.2]
  def up
    drop_table :memories
    drop_table :stories
    drop_table :users
  end

  def down
    create_table "users", force: :cascade do |t|
      t.string "first_name"
      t.string "last_name"
      t.string "email"
      t.string "password"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "username"
    end

    create_table :stories do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
    
    create_table :memories do |t|
      t.references :story, foreign_key: true
      t.references :user, foreign_key: true
      t.string :name
      t.date :date
      t.string :image
      t.string :description

      t.timestamps
    end
  end
end
