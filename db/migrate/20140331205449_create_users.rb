class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :file
      t.boolean :active
      t.string :choices
      t.string :sex

      t.timestamps
    end
  end
end
