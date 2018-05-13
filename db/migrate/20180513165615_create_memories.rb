class CreateMemories < ActiveRecord::Migration[5.2]
  def change
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
