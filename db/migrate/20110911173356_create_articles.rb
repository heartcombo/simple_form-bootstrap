class CreateArticles < ActiveRecord::Migration[4.2]
  def change
    create_table :articles do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
