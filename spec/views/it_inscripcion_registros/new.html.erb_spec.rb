require 'rails_helper'

RSpec.describe "it_inscripcion_registros/new", type: :view do
  before(:each) do
    assign(:it_inscripcion_registro, ItInscripcionRegistro.new(
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

  it "renders new it_inscripcion_registro form" do
    render

    assert_select "form[action=?][method=?]", it_inscripcion_registros_path, "post" do

      assert_select "input#it_inscripcion_registro_nombre[name=?]", "it_inscripcion_registro[nombre]"

      assert_select "input#it_inscripcion_registro_paterno[name=?]", "it_inscripcion_registro[paterno]"

      assert_select "input#it_inscripcion_registro_materno[name=?]", "it_inscripcion_registro[materno]"

      assert_select "input#it_inscripcion_registro_idioma[name=?]", "it_inscripcion_registro[idioma]"

      assert_select "input#it_inscripcion_registro_horario[name=?]", "it_inscripcion_registro[horario]"

      assert_select "input#it_inscripcion_registro_nivel[name=?]", "it_inscripcion_registro[nivel]"

      assert_select "input#it_inscripcion_registro_curso[name=?]", "it_inscripcion_registro[curso]"

      assert_select "input#it_inscripcion_registro_opcion_uno[name=?]", "it_inscripcion_registro[opcion_uno]"

      assert_select "input#it_inscripcion_registro_opcion_dos[name=?]", "it_inscripcion_registro[opcion_dos]"

      assert_select "input#it_inscripcion_registro_telefono[name=?]", "it_inscripcion_registro[telefono]"

      assert_select "input#it_inscripcion_registro_periodo[name=?]", "it_inscripcion_registro[periodo]"

      assert_select "input#it_inscripcion_registro_correo[name=?]", "it_inscripcion_registro[correo]"

      assert_select "input#it_inscripcion_registro_sexo[name=?]", "it_inscripcion_registro[sexo]"

      assert_select "input#it_inscripcion_registro_cuota[name=?]", "it_inscripcion_registro[cuota]"

      assert_select "input#it_inscripcion_registro_movimiento[name=?]", "it_inscripcion_registro[movimiento]"

      assert_select "input#it_inscripcion_registro_procedencia[name=?]", "it_inscripcion_registro[procedencia]"

      assert_select "input#it_inscripcion_registro_grupo_id[name=?]", "it_inscripcion_registro[grupo_id]"

      assert_select "input#it_inscripcion_registro_examen_medio[name=?]", "it_inscripcion_registro[examen_medio]"

      assert_select "input#it_inscripcion_registro_examen_final[name=?]", "it_inscripcion_registro[examen_final]"

      assert_select "input#it_inscripcion_registro_documentos_validados[name=?]", "it_inscripcion_registro[documentos_validados]"

      assert_select "input#it_inscripcion_registro_boleta[name=?]", "it_inscripcion_registro[boleta]"

      assert_select "input#it_inscripcion_registro_oferta_grupo[name=?]", "it_inscripcion_registro[oferta_grupo]"

      assert_select "input#it_inscripcion_registro_user_id[name=?]", "it_inscripcion_registro[user_id]"

      assert_select "input#it_inscripcion_registro_habilitar_constancia[name=?]", "it_inscripcion_registro[habilitar_constancia]"

      assert_select "input#it_inscripcion_registro_habilitar_historial[name=?]", "it_inscripcion_registro[habilitar_historial]"

      assert_select "input#it_inscripcion_registro_oficio_prestacion[name=?]", "it_inscripcion_registro[oficio_prestacion]"

      assert_select "input#it_inscripcion_registro_monto_pagado[name=?]", "it_inscripcion_registro[monto_pagado]"
    end
  end
end
