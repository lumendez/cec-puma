require 'rails_helper'

RSpec.describe "RegistroCursos", type: :request do
  describe "GET /registro_cursos" do
    it "works! (now write some real specs)" do
      get registro_cursos_path
      expect(response).to have_http_status(200)
    end
  end
end
