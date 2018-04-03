require 'rails_helper'

RSpec.describe "grupos_diplomados/new", type: :view do
  before(:each) do
    assign(:grupos_diplomado, GruposDiplomado.new(
      :nombre => "MyString",
      :horario => "MyString",
      :estado => "MyString",
      :anio => "MyString",
      :inicio => "MyString",
      :termino => "MyString",
      :horario => "MyString",
      :lugar => "MyString",
      :fecha => "MyString",
      :tipo => "MyString",
      :modalidad => "MyString",
      :cupo => "MyString",
      :duracion => "MyString",
      :cuota => "MyString",
      :clave => "MyString",
      :proyecto => "MyString",
      :institucion_bancaria => "MyString",
      :cuenta => "MyString",
      :titular => "MyString",
      :jefe_ec => "MyString",
      :registro => "MyString",
      :referencia => "MyString",
      :habilitar_constancias => false
    ))
  end

  it "renders new grupos_diplomado form" do
    render

    assert_select "form[action=?][method=?]", grupos_diplomados_path, "post" do

      assert_select "input#grupos_diplomado_nombre[name=?]", "grupos_diplomado[nombre]"

      assert_select "input#grupos_diplomado_horario[name=?]", "grupos_diplomado[horario]"

      assert_select "input#grupos_diplomado_estado[name=?]", "grupos_diplomado[estado]"

      assert_select "input#grupos_diplomado_anio[name=?]", "grupos_diplomado[anio]"

      assert_select "input#grupos_diplomado_inicio[name=?]", "grupos_diplomado[inicio]"

      assert_select "input#grupos_diplomado_termino[name=?]", "grupos_diplomado[termino]"

      assert_select "input#grupos_diplomado_horario[name=?]", "grupos_diplomado[horario]"

      assert_select "input#grupos_diplomado_lugar[name=?]", "grupos_diplomado[lugar]"

      assert_select "input#grupos_diplomado_fecha[name=?]", "grupos_diplomado[fecha]"

      assert_select "input#grupos_diplomado_tipo[name=?]", "grupos_diplomado[tipo]"

      assert_select "input#grupos_diplomado_modalidad[name=?]", "grupos_diplomado[modalidad]"

      assert_select "input#grupos_diplomado_cupo[name=?]", "grupos_diplomado[cupo]"

      assert_select "input#grupos_diplomado_duracion[name=?]", "grupos_diplomado[duracion]"

      assert_select "input#grupos_diplomado_cuota[name=?]", "grupos_diplomado[cuota]"

      assert_select "input#grupos_diplomado_clave[name=?]", "grupos_diplomado[clave]"

      assert_select "input#grupos_diplomado_proyecto[name=?]", "grupos_diplomado[proyecto]"

      assert_select "input#grupos_diplomado_institucion_bancaria[name=?]", "grupos_diplomado[institucion_bancaria]"

      assert_select "input#grupos_diplomado_cuenta[name=?]", "grupos_diplomado[cuenta]"

      assert_select "input#grupos_diplomado_titular[name=?]", "grupos_diplomado[titular]"

      assert_select "input#grupos_diplomado_jefe_ec[name=?]", "grupos_diplomado[jefe_ec]"

      assert_select "input#grupos_diplomado_registro[name=?]", "grupos_diplomado[registro]"

      assert_select "input#grupos_diplomado_referencia[name=?]", "grupos_diplomado[referencia]"

      assert_select "input#grupos_diplomado_habilitar_constancias[name=?]", "grupos_diplomado[habilitar_constancias]"
    end
  end
end
