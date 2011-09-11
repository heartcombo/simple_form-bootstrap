class AddContentTypeToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :content_type, :string
  end
end
