class ArticlesController < ApplicationController
  caches_page :index
  # GET /articles
  # GET /articles.xml
  def index
    @grid4_counter = 0
    @articles = Article.find(:all, :conditions => "deleted = 0 AND visible = 1")

    @articles = @articles.sort_by { |x| -x.weight }

    @articles.each do |a|
     a.main_article = false
    end
    @articles.first.main_article = true

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  def index_rest
    @grid4_counter = 0
    @articles = Article.find(:all, :conditions => "deleted = 0 AND visible = 1")

    @articles = @articles.sort_by { |x| -x.weight }
    @articles = @articles.drop(7)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
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
