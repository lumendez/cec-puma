require 'rails_helper'

RSpec.describe "ExamenColocacionIdiomas", type: :request do
  describe "GET /examen_colocacion_idiomas" do
    it "works! (now write some real specs)" do
      get examen_colocacion_idiomas_path
      expect(response).to have_http_status(200)
    end
  end
end
