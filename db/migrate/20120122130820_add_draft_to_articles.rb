class AddDraftToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :draft, :boolean
  end
end
