class DestinationsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  respond_to :js

  # GET /plan/1/destinations/new
  def new
    @plan        = Plan.find params[:plan_id]
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
      @destination.spot = @plan.destinations.last.spot
    end
  end

  # GET /plan/1/destinations/1/edit
  def edit
    @destination = Destination.find(params[:id])
    @plan        = @destination.plan
    spot         = @destination.spot
    @center_position = {
      :latitude  => spot.latitude,
      :longitude => spot.longitude,
      :zoom      => 14
    }
  end

  # POST /plan/1/destinations
  def create
    @destination         = Destination.new(params[:destination])
    @destination.plan_id = params[:plan_id]
    
    render :template => '/error.js', :locals => {:title => '行き先を追加できませんでした', :message => @destination.errors.full_messages.join("\n"), :script => nil} unless @destination.save
  end

  # PUT /plan/1/destinations/1
  def update
    @destination = Destination.find(params[:id])

    render :template => '/error.js', :locals => {:title => '行き先を更新できませんでした', :message => @destination.errors.full_messages.join("\n"), :script => nil} unless @destination.save
  end

  # DELETE /plan/1/destinations/1
  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy
  end

  # PUT /plan/1/destinations/1/position
  def reorder
    @destination = Destination.find(params[:id])

    render :template => '/error.js', :locals => {:title => '行き先を並べ替えられませんでした', :message => @destination.errors.full_messages.join("\n"), :script => nil} unless @destination.save
  end
end
