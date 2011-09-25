class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name, :null => false
      t.text :body, :null => false
      t.references :article

      t.timestamps
    end
    add_index :comments, :article_id
  end
end
