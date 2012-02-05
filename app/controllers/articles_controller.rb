class ArticlesController < ApplicationController
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
    @picture_path ="#{Rails.root}/public/assets/spp_article_images/" + "#{@article.id}.jpg"
    @picture = false
    if File.exists?(@picture_path)
      @picture_path = "/assets/spp_article_images/" + "#{@article.id}_3.jpg"
      @picture = true
    else
      @picture_path= "/assets/default/spp_default.png"
      @picture = true
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end
end
