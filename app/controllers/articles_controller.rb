class ArticlesController < ApplicationController

  respond_to :html, :xml
  # GET /articles
  # GET /articles.xml
  def index
    @articles = Article.visible.where(press_release: 0).sorted.limit(5)
    if I18n.locale =="en"
      @articles.reject!{|x| x.title_en.nil? || x.title_en == "" }
    else
      @articles.reject!{|x| x.title_no.nil? || x.title_no == "" }
    end
  end
 
  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])
  end
end
