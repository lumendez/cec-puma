require "rails_helper"

RSpec.describe ExamenColocacionIdiomasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/examen_colocacion_idiomas").to route_to("examen_colocacion_idiomas#index")
    end

    it "routes to #new" do
      expect(:get => "/examen_colocacion_idiomas/new").to route_to("examen_colocacion_idiomas#new")
    end

    it "routes to #show" do
      expect(:get => "/examen_colocacion_idiomas/1").to route_to("examen_colocacion_idiomas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/examen_colocacion_idiomas/1/edit").to route_to("examen_colocacion_idiomas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/examen_colocacion_idiomas").to route_to("examen_colocacion_idiomas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/examen_colocacion_idiomas/1").to route_to("examen_colocacion_idiomas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/examen_colocacion_idiomas/1").to route_to("examen_colocacion_idiomas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/examen_colocacion_idiomas/1").to route_to("examen_colocacion_idiomas#destroy", :id => "1")
    end

  end
end
