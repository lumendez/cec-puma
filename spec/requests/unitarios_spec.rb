require 'rails_helper'

RSpec.describe "Unitarios", type: :request do
  describe "GET /unitarios" do
    it "works! (now write some real specs)" do
      get unitarios_path
      expect(response).to have_http_status(200)
    end
  end
end
