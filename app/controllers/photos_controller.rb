require 'RMagick'
class PhotosController < ApplicationController
  layout "application_no_boxes"  
  def new
    @picture = Photo.new
  
  end

  def create
    @picture = Photo.new(params[:photo])
    @picture.save!
    
    respond_to do |format|
      format.html {redirect_to crop_photo_path(params[:tab], @picture) } 
    end
  end

  def show
    @picture = Photo.find(params[:id])

  end

  def crop
    @picture = Photo.find(params[:id])
  end

  def index
    @photos = Photo.find(:all)
 
    respond_to do |format|
      format.html
      format.js
    end
  end


  def crop_create
    @picture = Photo.find(params[:picture])
    url = (RAILS_ROOT + "/public/images/"+ @picture.original_picture.url)
    url = url.to_s.gsub!(/\?[1234567890]+/, "")
    @full = resize(params[:x1],params[:y1],params[:x2],params[:y2],url, 1)
    @half = resize(params[:x1_1],params[:y1_1],params[:x2_1],params[:y2_1],url, 2)
    @spp_one_third = resize(params[:x1_2],params[:y1_2],params[:x2_2],params[:y2_2],url, 3)
    @spp_full = resize(params[:x1_3],params[:y1_3],params[:x2_3],params[:y2_3],url, 4)
    @tmp_img = Tempfile.new("image_data.jpg")
    @tmp_img.write(@full)
    @picture.full_article_picture = @tmp_img
    @picture.full_article_picture.reprocess!
    @tmp_img = Tempfile.new("image_data.jpg")
    @tmp_img.write(@half)
    @picture.half_article_picture = @tmp_img
    @picture.half_article_picture.reprocess!
    @tmp_img = Tempfile.new("image_data.jpg")
    @tmp_img.write(@spp_one_third)
    @picture.spp_one_third_article_picture = @tmp_img
    @picture.spp_one_third_article_picture.reprocess!
    @tmp_img = Tempfile.new("image_data.jpg")
    @tmp_img.write(@spp_full)
    @picture.spp_full_article_picture = @tmp_img
    @picture.spp_full_article_picture.reprocess!

    @picture.save!

    @tmp_img.close

    respond_to do |format|
      format.html {redirect_to photos_path(params[:tab])} 
    end

  end



  private

  def resize(x1,y1,x2, y2, path, type)
    img_orig = Magick::Image.read(path).first
    #img_orig.format ="jpg"
    img_orig.crop!(x1.to_i,y1.to_i,(x2.to_i-x1.to_i),(y2.to_i-y1.to_i))
    if type == 1
      img_orig.resize_to_fit!(540,250)
    elsif type == 2
      img_orig.resize_to_fit!(260,340)
    elsif type == 3
      img_orig.resize_to_fit!(230,320)
    elsif type == 4
      img_orig.resize_to_fit!(700,320)
    else
      img_orig.resize_to_fit!(460,346)
    end
    img_orig.to_blob
  end
end
