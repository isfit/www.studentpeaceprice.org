class PagesController < ApplicationController

  # GET /pages/1
  # GET /pages/1.xml
  def show
    @page = Page.find(params[:id])
    @related = Article.visible.where(press_release: 0).sorted.limit(1)

    if I18n.locale == :en
      @related.reject!{|x| x.title_en.to_s.strip.length == 0 }
    else
      @related.reject!{|x| x.title_no.to_s.strip.length == 0 }
    end

    @picture_path ="#{Rails.root}/public/images/spp_page_images/" + "#{@page.id}.jpg"
    @picture = false
      if File.exists?(@picture_path)
        @picture_path = "/images/spp_page_images/" + "#{@page.id}_1.jpg"
        @picture = true
      end
    respond_to do |format|
      format.html # show.html.erb
    end
  end
end
