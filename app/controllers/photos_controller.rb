class PhotosController < ApplicationController
  before_filter :login_required, :except => [:index, :show]

  # GET /photos
  # GET /photos.xml
  def index
    @photos = Photo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.xml
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.xml
  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.xml
  def create
    if request.xhr?
      if request.body.size == request.headers['CONTENT_LENGTH'].to_i
        content  = request.body.read
        filename = params[:qqfile]
      end
    else
      if params[:qqfile].instance_of?(File)
        content  = params[:qqfile].read
        filename = params[:qqfile].original_filename
      end
    end

    raise "upload failure" unless content

    tf = StringIO.new(content)
    tf.original_filename = filename
    begin
      ActiveRecord::Base.transaction do
        @destination = Destination.find params[:destination_id]
        @photo = @destination.spot.photos.new
        @photo.user_id = current_user.id
        @photo.photo = tf
        @photo.save!
        @destination.photos << @photo
      end
    rescue => e
      render :json => {:error => e.message.to_s}
    else
      render :json => {:success => true}
    end
  end

  # PUT /photos/1
  # PUT /photos/1.xml
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to(@photo, :notice => 'Photo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.xml
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to(photos_url) }
      format.xml  { head :ok }
    end
  end
end
