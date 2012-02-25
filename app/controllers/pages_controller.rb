class PagesController < ApplicationController
  # GET /pages/1
  # GET /pages/1.xml
  def show
    @page = Page.find(params[:id])
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
