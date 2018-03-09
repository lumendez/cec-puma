require "rails_helper"

RSpec.describe GruposDiplomadosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/grupos_diplomados").to route_to("grupos_diplomados#index")
    end

    it "routes to #new" do
      expect(:get => "/grupos_diplomados/new").to route_to("grupos_diplomados#new")
    end

    it "routes to #show" do
      expect(:get => "/grupos_diplomados/1").to route_to("grupos_diplomados#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/grupos_diplomados/1/edit").to route_to("grupos_diplomados#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/grupos_diplomados").to route_to("grupos_diplomados#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/grupos_diplomados/1").to route_to("grupos_diplomados#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/grupos_diplomados/1").to route_to("grupos_diplomados#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/grupos_diplomados/1").to route_to("grupos_diplomados#destroy", :id => "1")
    end

  end
end
