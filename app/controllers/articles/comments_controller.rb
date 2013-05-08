class Articles::CommentsController < ApplicationController
  clear_respond_to
  respond_to :html

  before_filter :find_article

  def create
    @comment = Comment.new(params[:comment])
    @comment.article = @article

    if @comment.save
      redirect_to @article, :notice => 'Comment was successfully created.'
    else
      render "articles/show"
    end
  end

  private

  def find_article
    @article = Article.find(params[:article_id])
  end
end
