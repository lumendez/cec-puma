require 'rails_helper'

RSpec.describe "SeccionNombres", type: :request do
  describe "GET /seccion_nombres" do
    it "works! (now write some real specs)" do
      get seccion_nombres_path
      expect(response).to have_http_status(200)
    end
  end
end
