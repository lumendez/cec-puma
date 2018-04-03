require "rails_helper"

RSpec.describe InscripcionDiplomadosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/inscripcion_diplomados").to route_to("inscripcion_diplomados#index")
    end

    it "routes to #new" do
      expect(:get => "/inscripcion_diplomados/new").to route_to("inscripcion_diplomados#new")
    end

    it "routes to #show" do
      expect(:get => "/inscripcion_diplomados/1").to route_to("inscripcion_diplomados#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/inscripcion_diplomados/1/edit").to route_to("inscripcion_diplomados#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/inscripcion_diplomados").to route_to("inscripcion_diplomados#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/inscripcion_diplomados/1").to route_to("inscripcion_diplomados#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/inscripcion_diplomados/1").to route_to("inscripcion_diplomados#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/inscripcion_diplomados/1").to route_to("inscripcion_diplomados#destroy", :id => "1")
    end

  end
end
