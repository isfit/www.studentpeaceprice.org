class GalleryPhotosController < ApplicationController
  # GET /gallery_photos
  # GET /gallery_photos.xml
  def index
    @gallery_photos = GalleryPhoto.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gallery_photos }
    end
  end

  # GET /gallery_photos/1
  # GET /gallery_photos/1.xml
  def show
    @gallery_photo = GalleryPhoto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gallery_photo }
    end
  end

  # GET /gallery_photos/new
  # GET /gallery_photos/new.xml
  def new
    @gallery_photo = GalleryPhoto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gallery_photo }
    end
  end

  # GET /gallery_photos/1/edit
  def edit
    @gallery_photo = GalleryPhoto.find(params[:id])
  end

  # POST /gallery_photos
  # POST /gallery_photos.xml
  
  def create

    @gallery_album = GalleryAlbum.find(params[:album_id])
    @gallery_photo = GalleryPhoto.new
    @gallery_photo.gallery_album = @gallery_album
    
    # Associate the correct MIME type for the file since Flash will change it
    params[:Filedata].content_type = MIME::Types.type_for(params[:Filedata].original_filename).to_s
    
    @gallery_photo.photo = params[:Filedata]
    if @gallery_photo.save
        render :json => { 'status' => 'success'  }
    else
        render :json => { 'status' => 'error' }     
    end
  end
  
  # PUT /gallery_photos/1
  # PUT /gallery_photos/1.xml
  def update
    @gallery_photo = GalleryPhoto.find(params[:id])

    respond_to do |format|
      if @gallery_photo.update_attributes(params[:gallery_photo])
        format.html { redirect_to(@gallery_photo, :notice => 'Gallery photo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gallery_photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gallery_photos/1
  # DELETE /gallery_photos/1.xml
  def destroy
    @gallery_photo = GalleryPhoto.find(params[:id])
    @gallery_photo.destroy

    respond_to do |format|
      format.html { redirect_to(gallery_photos_url) }
      format.xml  { head :ok }
    end
  end
end
