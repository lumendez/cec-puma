require "rails_helper"

RSpec.describe RegistroCursosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/registro_cursos").to route_to("registro_cursos#index")
    end

    it "routes to #new" do
      expect(:get => "/registro_cursos/new").to route_to("registro_cursos#new")
    end

    it "routes to #show" do
      expect(:get => "/registro_cursos/1").to route_to("registro_cursos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/registro_cursos/1/edit").to route_to("registro_cursos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/registro_cursos").to route_to("registro_cursos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/registro_cursos/1").to route_to("registro_cursos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/registro_cursos/1").to route_to("registro_cursos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/registro_cursos/1").to route_to("registro_cursos#destroy", :id => "1")
    end

  end
end
