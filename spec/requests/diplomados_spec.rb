require 'rails_helper'

RSpec.describe "Diplomados", type: :request do
  describe "GET /diplomados" do
    it "works! (now write some real specs)" do
      get diplomados_path
      expect(response).to have_http_status(200)
    end
  end
end
