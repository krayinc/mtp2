require "spec_helper"

describe DestinationsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/destinations" }.should route_to(:controller => "destinations", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/destinations/new" }.should route_to(:controller => "destinations", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/destinations/1" }.should route_to(:controller => "destinations", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/destinations/1/edit" }.should route_to(:controller => "destinations", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/destinations" }.should route_to(:controller => "destinations", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/destinations/1" }.should route_to(:controller => "destinations", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/destinations/1" }.should route_to(:controller => "destinations", :action => "destroy", :id => "1")
    end

  end
end
