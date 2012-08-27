class ArticlesController < ApplicationController

  respond_to :html, :xml
  # GET /articles
  # GET /articles.xml
  def index
    @articles = Article.visible.where(press_release: 0).sorted.limit(5)
    if Language.to_s =="en"
      @articles.reject!{|x| x.title_en == "" }
    else
      @articles.reject!{|x| x.title_no == "" }
    end
  end

  def index_rest
    @articles = Article.visible.sorted.offset(7)
    if Language.to_s =="en"
      @articles.reject!{|x| x.title_en == "" }
    else
      @articles.reject!{|x| x.title_no == "" }
    end
  end
 
  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])
  end
end
