require 'rails_helper'

RSpec.describe "examen_colocacion_idiomas/index", type: :view do
  before(:each) do
    assign(:examen_colocacion_idiomas, [
      ExamenColocacionIdioma.create!(
        :nombre => "Nombre",
        :paterno => "Paterno",
        :materno => "Materno",
        :idioma => "Idioma",
        :nivel_asignado => "Nivel Asignado",
        :examinador => "Examinador"
      ),
      ExamenColocacionIdioma.create!(
        :nombre => "Nombre",
        :paterno => "Paterno",
        :materno => "Materno",
        :idioma => "Idioma",
        :nivel_asignado => "Nivel Asignado",
        :examinador => "Examinador"
      )
    ])
  end

  it "renders a list of examen_colocacion_idiomas" do
    render
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => "Paterno".to_s, :count => 2
    assert_select "tr>td", :text => "Materno".to_s, :count => 2
    assert_select "tr>td", :text => "Idioma".to_s, :count => 2
    assert_select "tr>td", :text => "Nivel Asignado".to_s, :count => 2
    assert_select "tr>td", :text => "Examinador".to_s, :count => 2
  end
end
