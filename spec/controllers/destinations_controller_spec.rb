require 'spec_helper'

describe DestinationsController do

  def mock_destination(stubs={})
    (@mock_destination ||= mock_model(Destination).as_null_object).tap do |destination|
      destination.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    pending "add some examples to (or delete) #{__FILE__}"
=begin
    it "assigns all destinations as @destinations" do
      Destination.stub(:all) { [mock_destination] }
      get :index
      assigns(:destinations).should eq([mock_destination])
    end
=end
  end

  describe "GET show" do
    pending "add some examples to (or delete) #{__FILE__}"
=begin
    it "assigns the requested destination as @destination" do
      Destination.stub(:find).with("37") { mock_destination }
      get :show, :id => "37"
      assigns(:destination).should be(mock_destination)
    end
=end
  end

  describe "GET new" do
    pending "add some examples to (or delete) #{__FILE__}"
=begin
    it "assigns a new destination as @destination" do
      Destination.stub(:new) { mock_destination }
      get :new
      assigns(:destination).should be(mock_destination)
    end
=end
  end

  describe "GET edit" do
    pending "add some examples to (or delete) #{__FILE__}"
=begin
    it "assigns the requested destination as @destination" do
      Destination.stub(:find).with("37") { mock_destination }
      get :edit, :id => "37"
      assigns(:destination).should be(mock_destination)
    end
=end
  end

  describe "POST create" do
    pending "add some examples to (or delete) #{__FILE__}"
=begin
    describe "with valid params" do
      it "assigns a newly created destination as @destination" do
        Destination.stub(:new).with({'these' => 'params'}) { mock_destination(:save => true) }
        post :create, :destination => {'these' => 'params'}
        assigns(:destination).should be(mock_destination)
      end

      it "redirects to the created destination" do
        Destination.stub(:new) { mock_destination(:save => true) }
        post :create, :destination => {}
        response.should redirect_to(destination_url(mock_destination))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved destination as @destination" do
        Destination.stub(:new).with({'these' => 'params'}) { mock_destination(:save => false) }
        post :create, :destination => {'these' => 'params'}
        assigns(:destination).should be(mock_destination)
      end

      it "re-renders the 'new' template" do
        Destination.stub(:new) { mock_destination(:save => false) }
        post :create, :destination => {}
        response.should render_template("new")
      end
    end
=end
  end

  describe "PUT update" do
    pending "add some examples to (or delete) #{__FILE__}"
=begin
    describe "with valid params" do
      it "updates the requested destination" do
        Destination.should_receive(:find).with("37") { mock_destination }
        mock_destination.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :destination => {'these' => 'params'}
      end

      it "assigns the requested destination as @destination" do
        Destination.stub(:find) { mock_destination(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:destination).should be(mock_destination)
      end

      it "redirects to the destination" do
        Destination.stub(:find) { mock_destination(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(destination_url(mock_destination))
      end
    end

    describe "with invalid params" do
      it "assigns the destination as @destination" do
        Destination.stub(:find) { mock_destination(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:destination).should be(mock_destination)
      end

      it "re-renders the 'edit' template" do
        Destination.stub(:find) { mock_destination(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
=end
  end

  describe "DELETE destroy" do
    pending "add some examples to (or delete) #{__FILE__}"
=begin
    it "destroys the requested destination" do
      Destination.should_receive(:find).with("37") { mock_destination }
      mock_destination.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the destinations list" do
      Destination.stub(:find) { mock_destination }
      delete :destroy, :id => "1"
      response.should redirect_to(destinations_url)
    end
=end
  end

end
