class CreateConcerts < ActiveRecord::Migration[6.1]
  def change
    create_table :concerts do |t|
      t.string :title
      t.string :artist
      t.date :date
      t.string :venue
      t.text :memo
      t.integer :user_id

      t.timestamps
    end
  end
end
