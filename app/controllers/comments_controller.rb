class CommentsController < ApplicationController

  before_filter :require_auth, :only => [:create]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create!(params[:comment])
    redirect_to @article, :notice => "Comment created!"  
  end
end
