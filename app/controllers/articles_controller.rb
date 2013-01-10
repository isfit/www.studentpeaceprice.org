class ArticlesController < ApplicationController

  before_filter :load_tabs

  respond_to :html, :xml
  # GET /articles
  # GET /articles.xml
  def index
    @articles = Article.visible.where(press_release: 0).sorted.limit(5)
    if I18n.locale == :en
      @articles.reject!{|x| x.title_en.to_s.strip.length == 0 }
    else
      @articles.reject!{|x| x.title_no.to_s.strip.length == 0 }
    end
  end
 
  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])
  end

  def all
    @articles = Article.visible.where(press_release: 0).sorted.paginate(:page => params[:page], :per_page => 5)
  end

  def load_tabs
    if params[:tab].nil? then params[:tab]="home" end
    @tabs = Tab.all
    @tabs.reject!{|tab|tab.sublinks.nil? || tab.sublinks.first.nil?}
    @current_tab = @tabs.find_by_tag(params[:tab])
  end
end
