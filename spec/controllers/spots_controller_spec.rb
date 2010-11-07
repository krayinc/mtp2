require 'spec_helper'

describe SpotsController do

  def mock_spot(stubs={})
    (@mock_spot ||= mock_model(Spot).as_null_object).tap do |spot|
      spot.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    pending "add some examples to (or delete) #{__FILE__}"
=begin
    it "assigns all spots as @spots" do
      Spot.stub(:all) { [mock_spot] }
      get :index
      assigns(:spots).should eq([mock_spot])
    end
=end
  end

  describe "GET show" do
    pending "add some examples to (or delete) #{__FILE__}"
=begin
    it "assigns the requested spot as @spot" do
      Spot.stub(:find).with("37") { mock_spot }
      get :show, :id => "37"
      assigns(:spot).should be(mock_spot)
    end
=end
  end

  describe "GET new" do
    pending "add some examples to (or delete) #{__FILE__}"
=begin
    it "assigns a new spot as @spot" do
      Spot.stub(:new) { mock_spot }
      get :new
      assigns(:spot).should be(mock_spot)
    end
=end
  end

  describe "GET edit" do
    pending "add some examples to (or delete) #{__FILE__}"
=begin
    it "assigns the requested spot as @spot" do
      Spot.stub(:find).with("37") { mock_spot }
      get :edit, :id => "37"
      assigns(:spot).should be(mock_spot)
    end
=end
  end

  describe "POST create" do
    pending "add some examples to (or delete) #{__FILE__}"
=begin
    describe "with valid params" do
      it "assigns a newly created spot as @spot" do
        Spot.stub(:new).with({'these' => 'params'}) { mock_spot(:save => true) }
        post :create, :spot => {'these' => 'params'}
        assigns(:spot).should be(mock_spot)
      end

      it "redirects to the created spot" do
        Spot.stub(:new) { mock_spot(:save => true) }
        post :create, :spot => {}
        response.should redirect_to(spot_url(mock_spot))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved spot as @spot" do
        Spot.stub(:new).with({'these' => 'params'}) { mock_spot(:save => false) }
        post :create, :spot => {'these' => 'params'}
        assigns(:spot).should be(mock_spot)
      end

      it "re-renders the 'new' template" do
        Spot.stub(:new) { mock_spot(:save => false) }
        post :create, :spot => {}
        response.should render_template("new")
      end
    end
=end
  end

  describe "PUT update" do
    pending "add some examples to (or delete) #{__FILE__}"
=begin
    describe "with valid params" do
      it "updates the requested spot" do
        Spot.should_receive(:find).with("37") { mock_spot }
        mock_spot.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :spot => {'these' => 'params'}
      end

      it "assigns the requested spot as @spot" do
        Spot.stub(:find) { mock_spot(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:spot).should be(mock_spot)
      end

      it "redirects to the spot" do
        Spot.stub(:find) { mock_spot(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(spot_url(mock_spot))
      end
    end

    describe "with invalid params" do
      it "assigns the spot as @spot" do
        Spot.stub(:find) { mock_spot(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:spot).should be(mock_spot)
      end

      it "re-renders the 'edit' template" do
        Spot.stub(:find) { mock_spot(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
=end
  end

  describe "DELETE destroy" do
    pending "add some examples to (or delete) #{__FILE__}"
=begin
    it "destroys the requested spot" do
      Spot.should_receive(:find).with("37") { mock_spot }
      mock_spot.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the spots list" do
      Spot.stub(:find) { mock_spot }
      delete :destroy, :id => "1"
      response.should redirect_to(spots_url)
    end
=end
  end

end
