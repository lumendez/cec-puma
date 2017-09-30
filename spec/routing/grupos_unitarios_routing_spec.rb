require "rails_helper"

RSpec.describe GruposUnitariosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/grupos_unitarios").to route_to("grupos_unitarios#index")
    end

    it "routes to #new" do
      expect(:get => "/grupos_unitarios/new").to route_to("grupos_unitarios#new")
    end

    it "routes to #show" do
      expect(:get => "/grupos_unitarios/1").to route_to("grupos_unitarios#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/grupos_unitarios/1/edit").to route_to("grupos_unitarios#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/grupos_unitarios").to route_to("grupos_unitarios#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/grupos_unitarios/1").to route_to("grupos_unitarios#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/grupos_unitarios/1").to route_to("grupos_unitarios#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/grupos_unitarios/1").to route_to("grupos_unitarios#destroy", :id => "1")
    end

  end
end
