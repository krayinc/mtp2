require "spec_helper"

describe SpotsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/spots" }.should route_to(:controller => "spots", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/spots/new" }.should route_to(:controller => "spots", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/spots/1" }.should route_to(:controller => "spots", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/spots/1/edit" }.should route_to(:controller => "spots", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/spots" }.should route_to(:controller => "spots", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/spots/1" }.should route_to(:controller => "spots", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/spots/1" }.should route_to(:controller => "spots", :action => "destroy", :id => "1")
    end

  end
end
