class DestroyArticleAndComments < ActiveRecord::Migration
  def change
    drop_table :articles
    drop_table :comments
  end
end
