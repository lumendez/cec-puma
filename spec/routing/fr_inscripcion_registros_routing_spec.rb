require "rails_helper"

RSpec.describe FrInscripcionRegistrosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/fr_inscripcion_registros").to route_to("fr_inscripcion_registros#index")
    end

    it "routes to #new" do
      expect(:get => "/fr_inscripcion_registros/new").to route_to("fr_inscripcion_registros#new")
    end

    it "routes to #show" do
      expect(:get => "/fr_inscripcion_registros/1").to route_to("fr_inscripcion_registros#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/fr_inscripcion_registros/1/edit").to route_to("fr_inscripcion_registros#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/fr_inscripcion_registros").to route_to("fr_inscripcion_registros#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/fr_inscripcion_registros/1").to route_to("fr_inscripcion_registros#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/fr_inscripcion_registros/1").to route_to("fr_inscripcion_registros#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/fr_inscripcion_registros/1").to route_to("fr_inscripcion_registros#destroy", :id => "1")
    end

  end
end
