require 'rails_helper'

RSpec.describe "inscripcion_diplomados/new", type: :view do
  before(:each) do
    assign(:inscripcion_diplomado, InscripcionDiplomado.new(
      :curp => "MyString",
      :nombre => "MyString",
      :paterno => "MyString",
      :materno => "MyString",
      :sexo => "MyString",
      :nacimiento => "MyString",
      :domicilio => "MyString",
      :codigo_postal => "MyString",
      :entidad => "MyString",
      :delegacion_municipio => "MyString",
      :telefono_celular => "MyString",
      :telefono_fijo => "MyString",
      :correo => "MyString",
      :procedencia => "MyString",
      :grupos_diplomado => nil,
      :documentos_validados => false
    ))
  end

  it "renders new inscripcion_diplomado form" do
    render

    assert_select "form[action=?][method=?]", inscripcion_diplomados_path, "post" do

      assert_select "input#inscripcion_diplomado_curp[name=?]", "inscripcion_diplomado[curp]"

      assert_select "input#inscripcion_diplomado_nombre[name=?]", "inscripcion_diplomado[nombre]"

      assert_select "input#inscripcion_diplomado_paterno[name=?]", "inscripcion_diplomado[paterno]"

      assert_select "input#inscripcion_diplomado_materno[name=?]", "inscripcion_diplomado[materno]"

      assert_select "input#inscripcion_diplomado_sexo[name=?]", "inscripcion_diplomado[sexo]"

      assert_select "input#inscripcion_diplomado_nacimiento[name=?]", "inscripcion_diplomado[nacimiento]"

      assert_select "input#inscripcion_diplomado_domicilio[name=?]", "inscripcion_diplomado[domicilio]"

      assert_select "input#inscripcion_diplomado_codigo_postal[name=?]", "inscripcion_diplomado[codigo_postal]"

      assert_select "input#inscripcion_diplomado_entidad[name=?]", "inscripcion_diplomado[entidad]"

      assert_select "input#inscripcion_diplomado_delegacion_municipio[name=?]", "inscripcion_diplomado[delegacion_municipio]"

      assert_select "input#inscripcion_diplomado_telefono_celular[name=?]", "inscripcion_diplomado[telefono_celular]"

      assert_select "input#inscripcion_diplomado_telefono_fijo[name=?]", "inscripcion_diplomado[telefono_fijo]"

      assert_select "input#inscripcion_diplomado_correo[name=?]", "inscripcion_diplomado[correo]"

      assert_select "input#inscripcion_diplomado_procedencia[name=?]", "inscripcion_diplomado[procedencia]"

      assert_select "input#inscripcion_diplomado_grupos_diplomado_id[name=?]", "inscripcion_diplomado[grupos_diplomado_id]"

      assert_select "input#inscripcion_diplomado_documentos_validados[name=?]", "inscripcion_diplomado[documentos_validados]"
    end
  end
end
