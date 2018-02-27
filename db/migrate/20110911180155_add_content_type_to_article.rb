class AddContentTypeToArticle < ActiveRecord::Migration[4.2]
  def change
    add_column :articles, :content_type, :string
  end
end
