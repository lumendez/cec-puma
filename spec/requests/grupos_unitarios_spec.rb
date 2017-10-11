require 'rails_helper'

RSpec.describe "GruposUnitarios", type: :request do
  describe "GET /grupos_unitarios" do
    it "works! (now write some real specs)" do
      get grupos_unitarios_path
      expect(response).to have_http_status(200)
    end
  end
end
