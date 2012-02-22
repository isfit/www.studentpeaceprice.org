class ArticlesController < ApplicationController
  caches_page :index
  respond_to :html, :xml
  # GET /articles
  # GET /articles.xml
  def index
    @articles = Article.visible.sorted.limit(7)
    @main_article = @articles.shift
  end

  def index_rest
    @articles = Article.visible.sorted.offset(7)
  end
 
  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])
  end
end
