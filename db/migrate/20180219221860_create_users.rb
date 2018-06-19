class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, force: true do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :avatar
      t.text :bio
      t.date :birthday
      t.string :color
      t.string :fruit
      t.string :music
      t.string :pill
      t.string :choises
      t.string :language
      t.integer :friends
      t.integer :mood
      t.time :awake
      t.datetime :first_kiss
      t.boolean :active
      t.boolean :terms

      t.timestamps
    end
  end
end
