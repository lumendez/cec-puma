require 'rails_helper'

RSpec.describe AnexosUnicosExamenController, type: :controller do

  describe "GET #imprimir_anexo_unico" do
    it "returns http success" do
      get :imprimir_anexo_unico
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
