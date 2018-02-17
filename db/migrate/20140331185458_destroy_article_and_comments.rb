class DestroyArticleAndComments < ActiveRecord::Migration[4.2]
  def change
    drop_table :articles
    drop_table :comments
  end
end
