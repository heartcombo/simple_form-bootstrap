class AddSecretToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :secret, :boolean
  end
end
