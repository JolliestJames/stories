class DropUsers < ActiveRecord::Migration[5.2]
  def up
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
  end
end
