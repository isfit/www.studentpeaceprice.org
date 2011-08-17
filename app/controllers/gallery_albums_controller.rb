class GalleryAlbumsController < ApplicationController
  # GET /gallery_albums
  # GET /gallery_albums.xml
  def index
    @gallery_albums = GalleryAlbum.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gallery_albums }
    end
  end

  # GET /gallery_albums/1
  # GET /gallery_albums/1.xml
  def show
    @gallery_album = GalleryAlbum.find(params[:id])
    unless (@gallery_album.gallery_id == 7) 
      return
    end
    @album_photos = GalleryPhoto.where(:gallery_album_id => @gallery_album.id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gallery_album }
    end
  end

  # GET /gallery_albums/new
  # GET /gallery_albums/new.xml
  def new
    @gallery_album = GalleryAlbum.new
    1.times { @gallery_album.gallery_photos.build }

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gallery_album }
    end
  end

  # GET /gallery_albums/1/edit
  def edit
    @gallery_album = GalleryAlbum.find(params[:id])
    1.times { @gallery_album.gallery_photos.build }
  end

  # POST /gallery_albums
  # POST /gallery_albums.xml
  def create
    @gallery_album = GalleryAlbum.new(params[:gallery_album])
    @gallery_album.creator = current_person.id
    @gallery_album.gallery_id = params[:gallery_id].to_i

    respond_to do |format|
      if @gallery_album.save
        format.html { redirect_to(gallery_album_path(params[:tab], @gallery_album.gallery_id, @gallery_album.id), :notice => 'Gallery album was successfully created.') }
        format.xml  { render :xml => @gallery_album, :status => :created, :location => @gallery_album }
      else
        format.html { render :action => "new"}
        format.xml  { render :xml => @gallery_album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gallery_albums/1
  # PUT /gallery_albums/1.xml
  def update
    @gallery_album = GalleryAlbum.find(params[:id])
    @gallery_album.album_cover = params[:photo_front]

    respond_to do |format|
      if @gallery_album.update_attributes(params[:gallery_album])
        format.html { redirect_to(gallery_album_path(params[:tab], @gallery_album.gallery, @gallery_album), :notice => 'Gallery album was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gallery_album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gallery_albums/1
  # DELETE /gallery_albums/1.xml
  def destroy
    @gallery_album = GalleryAlbum.find(params[:id])
    @gallery_album.destroy if (current_person.id == @gallery_album.creator)

    respond_to do |format|
      format.html { redirect_to(gallery_path(params[:tab], @gallery_album.gallery_id)) }
      format.xml  { head :ok }
    end
  end
end
