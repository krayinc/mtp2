class PlansController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  respond_to :js, :html

  # GET /plans
  # GET /plans.xml
  def index
    @plans = Plan.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @plans }
    end
  end

  # GET /plans/1
  # GET /plans/1.xml
  def show
    @plan = Plan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @plan }
    end
  end

  # GET /plans/new
  # GET /plans/new.xml
  def new
    @plan = Plan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @plan }
    end
  end

  # GET /plans/1/edit
  def edit
    @plan = Plan.find(params[:id])
  end

  # POST /plans
  # POST /plans.xml
  def create
    @plan = Plan.new(params[:plan])
    @plan.owner = current_user

    respond_to do |format|
      if @plan.save
        format.html { redirect_to(edit_plan_path(@plan), :notice => 'Plan was successfully created.') }
        format.xml  { render :xml => @plan, :status => :created, :location => @plan }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /plans/1
  # PUT /plans/1.xml
  def update
    @plan = Plan.find(params[:id])

    respond_to do |format|
      if @plan.update_attributes(params[:plan])
        format.html { redirect_to(@plan, :notice => 'Plan was successfully updated.') }
        format.xml  { head :ok }
        format.js
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @plan.errors, :status => :unprocessable_entity }
        format.js   {
          render :update do |page|
            page << %Q|$.gritter.add({title: 'MTP', text: "プランの更新に失敗しました。<br>#{@plan.errors.to_s}"});|
          end
        }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.xml
  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy

    respond_to do |format|
      format.html { redirect_to(plans_url) }
      format.xml  { head :ok }
    end
  end
  
  # PUT /plans/1/vote
  def vote
    @plan = Plan.find(params[:id])
    @voting = @plan.vote!(current_user)
    respond_with @voting
  end
  
  # PUT /plans/1/vote
  def unvote
    @plan = Plan.find(params[:id])
    @voting = @plan.unvote!(current_user)
    respond_with @voting
  end

  # GET /plans/1/photos
  def photos
    @plan = Plan.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # PUT /plans/1/photo
  def update_photo
    @plan = Plan.find(params[:id])
    if Plan.includes(:destinations => {:destination_photos => :photo}).where('plans.id = ? AND spot_photos.id = ?', params[:id], params[:plan][:photo_id]).exists?
      @plan.photo_id = params[:plan][:photo_id]
    end
    respond_to do |format|
      if @plan.save
        format.js
      else
        format.js   {
          render :update do |page|
            page << %Q|$.gritter.add({title: 'MTP', text: "写真の更新に失敗しました。<br>#{@plan.errors.to_s}"});|
          end
        }
      end
    end
  end
  
end
