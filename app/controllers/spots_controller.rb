class SpotsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  respond_to :js, :json, :html
  # GET /spots
  # GET /spots.xml
  # GET /spots.json
  def index
    if params[:q].blank?
      @spots = Spot.all
    else
      @spots = Spot.where('name LIKE ?', "%#{params[:q]}%")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @spots }
      format.js
    end
  end

  # GET /spots/1
  # GET /spots/1.xml
  def show
    @spot = Spot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @spot }
    end
  end

  # GET /spots/new
  # GET /spots/new.xml
  def new
    if params[:latitude] and params[:longitude]
      @spot = Spot.new(:latitude => params[:latitude], :longitude => params[:longitude])
      @zoom = 14
    else
      @spot = Spot.new(:latitude => Spot::DEFAULT_POSITION[:latitude], :longitude => Spot::DEFAULT_POSITION[:longitude])
      @zoom = Spot::DEFAULT_POSITION[:zoom]
    end

    respond_to do |format|
      format.js
      format.html # new.html.erb
      format.xml  { render :xml => @spot }
    end
  end

  # GET /spots/1/edit
  def edit
    @spot = Spot.find(params[:id])
    @zoom = 17
  end

  # POST /spots
  # POST /spots.xml
  def create
    @spot = Spot.new(params[:spot])

    respond_to do |format|
      if @spot.save
        format.js
        format.html { redirect_to(@spot, :notice => 'Spot was successfully created.') }
        format.xml  { render :xml => @spot, :status => :created, :location => @spot }
      else
        format.js   { render :template => '/error.js', :locals => {:title => '作成できませんでした', :message => @spot.errors.full_messages.join("\n"), :script => nil} }
        format.html { render :action => "new" }
        format.xml  { render :xml => @spot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /spots/1
  # PUT /spots/1.xml
  def update
    @spot = Spot.find(params[:id])

    respond_to do |format|
      if @spot.update_attributes(params[:spot])
        format.js
        format.html { redirect_to(@spot, :notice => 'Spot was successfully updated.') }
        format.xml  { head :ok }
      else
        format.js   { render :template => '/error.js', :locals => {:title => '更新できませんでした', :message => @spot.errors.full_messages.join("\n"), :script => nil} }
        format.html { render :action => "edit" }
        format.xml  { render :xml => @spot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /spots/1
  # DELETE /spots/1.xml
  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy

    respond_to do |format|
      format.html { redirect_to(spots_url) }
      format.xml  { head :ok }
    end
  end
  
  # PUT /spots/1/rate.json
  def rate
    @spot = Spot.find(params[:id])
    @spot.rate!(params[:score].to_i, current_user)
    respond_with @spot
  end
  
end
