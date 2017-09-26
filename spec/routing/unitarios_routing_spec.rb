require "rails_helper"

RSpec.describe UnitariosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/unitarios").to route_to("unitarios#index")
    end

    it "routes to #new" do
      expect(:get => "/unitarios/new").to route_to("unitarios#new")
    end

    it "routes to #show" do
      expect(:get => "/unitarios/1").to route_to("unitarios#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/unitarios/1/edit").to route_to("unitarios#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/unitarios").to route_to("unitarios#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/unitarios/1").to route_to("unitarios#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/unitarios/1").to route_to("unitarios#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/unitarios/1").to route_to("unitarios#destroy", :id => "1")
    end

  end
end
