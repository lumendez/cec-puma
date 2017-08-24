require 'rails_helper'

RSpec.describe "fr_inscripcion_registros/edit", type: :view do
  before(:each) do
    @fr_inscripcion_registro = assign(:fr_inscripcion_registro, FrInscripcionRegistro.create!(
      :nombre => "MyString",
      :paterno => "MyString",
      :materno => "MyString",
      :idioma => "MyString",
      :horario => "MyString",
      :nivel => "MyString",
      :curso => "MyString",
      :opcion_uno => "MyString",
      :opcion_dos => "MyString",
      :telefono => "MyString",
      :periodo => "MyString",
      :correo => "MyString",
      :sexo => "MyString",
      :cuota => "MyString",
      :movimiento => "MyString",
      :procedencia => "MyString",
      :grupo => nil,
      :examen_medio => 1,
      :examen_final => 1,
      :documentos_validados => false,
      :boleta => "MyString",
      :oferta_grupo => "MyString",
      :user => nil,
      :habilitar_constancia => false,
      :habilitar_historial => false,
      :oficio_prestacion => "MyString",
      :monto_pagado => "MyString"
    ))
  end

  it "renders the edit fr_inscripcion_registro form" do
    render

    assert_select "form[action=?][method=?]", fr_inscripcion_registro_path(@fr_inscripcion_registro), "post" do

      assert_select "input#fr_inscripcion_registro_nombre[name=?]", "fr_inscripcion_registro[nombre]"

      assert_select "input#fr_inscripcion_registro_paterno[name=?]", "fr_inscripcion_registro[paterno]"

      assert_select "input#fr_inscripcion_registro_materno[name=?]", "fr_inscripcion_registro[materno]"

      assert_select "input#fr_inscripcion_registro_idioma[name=?]", "fr_inscripcion_registro[idioma]"

      assert_select "input#fr_inscripcion_registro_horario[name=?]", "fr_inscripcion_registro[horario]"

      assert_select "input#fr_inscripcion_registro_nivel[name=?]", "fr_inscripcion_registro[nivel]"

      assert_select "input#fr_inscripcion_registro_curso[name=?]", "fr_inscripcion_registro[curso]"

      assert_select "input#fr_inscripcion_registro_opcion_uno[name=?]", "fr_inscripcion_registro[opcion_uno]"

      assert_select "input#fr_inscripcion_registro_opcion_dos[name=?]", "fr_inscripcion_registro[opcion_dos]"

      assert_select "input#fr_inscripcion_registro_telefono[name=?]", "fr_inscripcion_registro[telefono]"

      assert_select "input#fr_inscripcion_registro_periodo[name=?]", "fr_inscripcion_registro[periodo]"

      assert_select "input#fr_inscripcion_registro_correo[name=?]", "fr_inscripcion_registro[correo]"

      assert_select "input#fr_inscripcion_registro_sexo[name=?]", "fr_inscripcion_registro[sexo]"

      assert_select "input#fr_inscripcion_registro_cuota[name=?]", "fr_inscripcion_registro[cuota]"

      assert_select "input#fr_inscripcion_registro_movimiento[name=?]", "fr_inscripcion_registro[movimiento]"

      assert_select "input#fr_inscripcion_registro_procedencia[name=?]", "fr_inscripcion_registro[procedencia]"

      assert_select "input#fr_inscripcion_registro_grupo_id[name=?]", "fr_inscripcion_registro[grupo_id]"

      assert_select "input#fr_inscripcion_registro_examen_medio[name=?]", "fr_inscripcion_registro[examen_medio]"

      assert_select "input#fr_inscripcion_registro_examen_final[name=?]", "fr_inscripcion_registro[examen_final]"

      assert_select "input#fr_inscripcion_registro_documentos_validados[name=?]", "fr_inscripcion_registro[documentos_validados]"

      assert_select "input#fr_inscripcion_registro_boleta[name=?]", "fr_inscripcion_registro[boleta]"

      assert_select "input#fr_inscripcion_registro_oferta_grupo[name=?]", "fr_inscripcion_registro[oferta_grupo]"

      assert_select "input#fr_inscripcion_registro_user_id[name=?]", "fr_inscripcion_registro[user_id]"

      assert_select "input#fr_inscripcion_registro_habilitar_constancia[name=?]", "fr_inscripcion_registro[habilitar_constancia]"

      assert_select "input#fr_inscripcion_registro_habilitar_historial[name=?]", "fr_inscripcion_registro[habilitar_historial]"

      assert_select "input#fr_inscripcion_registro_oficio_prestacion[name=?]", "fr_inscripcion_registro[oficio_prestacion]"

      assert_select "input#fr_inscripcion_registro_monto_pagado[name=?]", "fr_inscripcion_registro[monto_pagado]"
    end
  end
end
