require 'rails_helper'

RSpec.describe "grupos_unitarios/edit", type: :view do
  before(:each) do
    @grupos_unitario = assign(:grupos_unitario, GruposUnitario.create!(
      :nombre => "MyString",
      :horario => "MyString",
      :estado => "MyString",
      :anio => "MyString",
      :periodo => "MyString",
      :lugar => "MyString",
      :fecha => "MyString",
      :centro => "MyString",
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
      :habilitar_constancias_grupo => false
    ))
  end

  it "renders the edit grupos_unitario form" do
    render

    assert_select "form[action=?][method=?]", grupos_unitario_path(@grupos_unitario), "post" do

      assert_select "input#grupos_unitario_nombre[name=?]", "grupos_unitario[nombre]"

      assert_select "input#grupos_unitario_horario[name=?]", "grupos_unitario[horario]"

      assert_select "input#grupos_unitario_estado[name=?]", "grupos_unitario[estado]"

      assert_select "input#grupos_unitario_anio[name=?]", "grupos_unitario[anio]"

      assert_select "input#grupos_unitario_periodo[name=?]", "grupos_unitario[periodo]"

      assert_select "input#grupos_unitario_lugar[name=?]", "grupos_unitario[lugar]"

      assert_select "input#grupos_unitario_fecha[name=?]", "grupos_unitario[fecha]"

      assert_select "input#grupos_unitario_centro[name=?]", "grupos_unitario[centro]"

      assert_select "input#grupos_unitario_tipo[name=?]", "grupos_unitario[tipo]"

      assert_select "input#grupos_unitario_modalidad[name=?]", "grupos_unitario[modalidad]"

      assert_select "input#grupos_unitario_cupo[name=?]", "grupos_unitario[cupo]"

      assert_select "input#grupos_unitario_duracion[name=?]", "grupos_unitario[duracion]"

      assert_select "input#grupos_unitario_cuota[name=?]", "grupos_unitario[cuota]"

      assert_select "input#grupos_unitario_clave[name=?]", "grupos_unitario[clave]"

      assert_select "input#grupos_unitario_proyecto[name=?]", "grupos_unitario[proyecto]"

      assert_select "input#grupos_unitario_institucion_bancaria[name=?]", "grupos_unitario[institucion_bancaria]"

      assert_select "input#grupos_unitario_cuenta[name=?]", "grupos_unitario[cuenta]"

      assert_select "input#grupos_unitario_titular[name=?]", "grupos_unitario[titular]"

      assert_select "input#grupos_unitario_jefe_ec[name=?]", "grupos_unitario[jefe_ec]"

      assert_select "input#grupos_unitario_registro[name=?]", "grupos_unitario[registro]"

      assert_select "input#grupos_unitario_referencia[name=?]", "grupos_unitario[referencia]"

      assert_select "input#grupos_unitario_habilitar_constancias_grupo[name=?]", "grupos_unitario[habilitar_constancias_grupo]"
    end
  end
end
