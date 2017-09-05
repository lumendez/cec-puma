require "rails_helper"

RSpec.describe ItInscripcionRegistrosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/it_inscripcion_registros").to route_to("it_inscripcion_registros#index")
    end

    it "routes to #new" do
      expect(:get => "/it_inscripcion_registros/new").to route_to("it_inscripcion_registros#new")
    end

    it "routes to #show" do
      expect(:get => "/it_inscripcion_registros/1").to route_to("it_inscripcion_registros#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/it_inscripcion_registros/1/edit").to route_to("it_inscripcion_registros#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/it_inscripcion_registros").to route_to("it_inscripcion_registros#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/it_inscripcion_registros/1").to route_to("it_inscripcion_registros#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/it_inscripcion_registros/1").to route_to("it_inscripcion_registros#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/it_inscripcion_registros/1").to route_to("it_inscripcion_registros#destroy", :id => "1")
    end

  end
end
