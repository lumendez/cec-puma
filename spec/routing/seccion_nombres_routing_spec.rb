require "rails_helper"

RSpec.describe SeccionNombresController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/seccion_nombres").to route_to("seccion_nombres#index")
    end

    it "routes to #new" do
      expect(:get => "/seccion_nombres/new").to route_to("seccion_nombres#new")
    end

    it "routes to #show" do
      expect(:get => "/seccion_nombres/1").to route_to("seccion_nombres#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/seccion_nombres/1/edit").to route_to("seccion_nombres#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/seccion_nombres").to route_to("seccion_nombres#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/seccion_nombres/1").to route_to("seccion_nombres#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/seccion_nombres/1").to route_to("seccion_nombres#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/seccion_nombres/1").to route_to("seccion_nombres#destroy", :id => "1")
    end

  end
end
