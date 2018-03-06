require "rails_helper"

RSpec.describe DiplomadosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/diplomados").to route_to("diplomados#index")
    end

    it "routes to #new" do
      expect(:get => "/diplomados/new").to route_to("diplomados#new")
    end

    it "routes to #show" do
      expect(:get => "/diplomados/1").to route_to("diplomados#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/diplomados/1/edit").to route_to("diplomados#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/diplomados").to route_to("diplomados#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/diplomados/1").to route_to("diplomados#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/diplomados/1").to route_to("diplomados#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/diplomados/1").to route_to("diplomados#destroy", :id => "1")
    end

  end
end
