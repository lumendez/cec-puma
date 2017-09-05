require 'rails_helper'

RSpec.describe "FrInscripcionRegistros", type: :request do
  describe "GET /fr_inscripcion_registros" do
    it "works! (now write some real specs)" do
      get fr_inscripcion_registros_path
      expect(response).to have_http_status(200)
    end
  end
end
