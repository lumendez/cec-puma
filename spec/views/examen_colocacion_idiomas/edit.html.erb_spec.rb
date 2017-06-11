require 'rails_helper'

RSpec.describe "examen_colocacion_idiomas/edit", type: :view do
  before(:each) do
    @examen_colocacion_idioma = assign(:examen_colocacion_idioma, ExamenColocacionIdioma.create!(
      :nombre => "MyString",
      :paterno => "MyString",
      :materno => "MyString",
      :idioma => "MyString",
      :nivel_asignado => "MyString",
      :examinador => "MyString"
    ))
  end

  it "renders the edit examen_colocacion_idioma form" do
    render

    assert_select "form[action=?][method=?]", examen_colocacion_idioma_path(@examen_colocacion_idioma), "post" do

      assert_select "input#examen_colocacion_idioma_nombre[name=?]", "examen_colocacion_idioma[nombre]"

      assert_select "input#examen_colocacion_idioma_paterno[name=?]", "examen_colocacion_idioma[paterno]"

      assert_select "input#examen_colocacion_idioma_materno[name=?]", "examen_colocacion_idioma[materno]"

      assert_select "input#examen_colocacion_idioma_idioma[name=?]", "examen_colocacion_idioma[idioma]"

      assert_select "input#examen_colocacion_idioma_nivel_asignado[name=?]", "examen_colocacion_idioma[nivel_asignado]"

      assert_select "input#examen_colocacion_idioma_examinador[name=?]", "examen_colocacion_idioma[examinador]"
    end
  end
end
