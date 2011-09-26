class Articles::CommentsController < ApplicationController
  clear_respond_to
  respond_to :html

  before_filter :find_article

  def create
    @comment = Comment.new(params[:comment])
    @comment.article = @article

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @article, :notice => 'Comment was successfully created.' }
      else
        format.html { render "articles/show" }
      end
    end
  end

  private

  def find_article
    @article = Article.find(params[:article_id])
  end
end
