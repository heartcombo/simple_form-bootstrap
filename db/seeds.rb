Article.delete_all
Comment.delete_all

article = Article.create!(:name => 'SimpleForm 2.0')
article.comments.create(:name => 'Rafael', :body => 'It Rocks!')

Article.create!(:name => 'SimpleForm + Twitter Bootstrap')
