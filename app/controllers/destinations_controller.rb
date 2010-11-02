class DestinationsController < ApplicationController
  # GET /destinations
  # GET /destinations.xml
  def index
    @destinations = Destination.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @destinations }
    end
  end

  # GET /destinations/1
  # GET /destinations/1.xml
  def show
    @destination = Destination.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @destination }
    end
  end

  # GET /destinations/new
  # GET /destinations/new.xml
  def new
    @plan = Plan.find params[:plan_id]
    @destination = @plan.destinations.new
    if @plan.destinations.empty?
      @center_position = Spot::DEFAULT_POSITION
    else
      spot = @plan.destinations.last.spot
      @center_position = {
        :latitude  => spot.latitude,
        :longitude => spot.longitude,
        :zoom      => 14
      }
    end

    respond_to do |format|
      format.js
      format.html # new.html.erb
      format.xml  { render :xml => @destination }
    end
  end

  # GET /destinations/1/edit
  def edit
    @destination = Destination.find(params[:id])
    @plan        = @destination.plan
    spot = @destination.spot
    @center_position = {
      :latitude  => spot.latitude,
      :longitude => spot.longitude,
      :zoom      => 14
    }

    respond_to do |format|
      format.js
      format.html # new.html.erb
      format.xml  { render :xml => @destination }
    end
  end

  # POST /destinations
  # POST /destinations.xml
  def create
    @destination = Destination.new(params[:destination])
    @destination.plan_id = params[:plan_id]

    respond_to do |format|
      if @destination.save
        format.js
        format.html { redirect_to(@destination, :notice => 'Destination was successfully created.') }
        format.xml  { render :xml => @destination, :status => :created, :location => @destination }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @destination.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /destinations/1
  # PUT /destinations/1.xml
  def update
    @destination = Destination.find(params[:id])

    respond_to do |format|
      if @destination.update_attributes(params[:destination])
        format.js
        format.html { redirect_to(@destination, :notice => 'Destination was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @destination.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /destinations/1
  # DELETE /destinations/1.xml
  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to(destinations_url) }
      format.xml  { head :ok }
    end
  end
end
