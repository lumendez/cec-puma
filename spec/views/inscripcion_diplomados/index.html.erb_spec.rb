require 'rails_helper'

RSpec.describe "inscripcion_diplomados/index", type: :view do
  before(:each) do
    assign(:inscripcion_diplomados, [
      InscripcionDiplomado.create!(
        :curp => "Curp",
        :nombre => "Nombre",
        :paterno => "Paterno",
        :materno => "Materno",
        :sexo => "Sexo",
        :nacimiento => "Nacimiento",
        :domicilio => "Domicilio",
        :codigo_postal => "Codigo Postal",
        :entidad => "Entidad",
        :delegacion_municipio => "Delegacion Municipio",
        :telefono_celular => "Telefono Celular",
        :telefono_fijo => "Telefono Fijo",
        :correo => "Correo",
        :procedencia => "Procedencia",
        :grupos_diplomado => nil,
        :documentos_validados => false
      ),
      InscripcionDiplomado.create!(
        :curp => "Curp",
        :nombre => "Nombre",
        :paterno => "Paterno",
        :materno => "Materno",
        :sexo => "Sexo",
        :nacimiento => "Nacimiento",
        :domicilio => "Domicilio",
        :codigo_postal => "Codigo Postal",
        :entidad => "Entidad",
        :delegacion_municipio => "Delegacion Municipio",
        :telefono_celular => "Telefono Celular",
        :telefono_fijo => "Telefono Fijo",
        :correo => "Correo",
        :procedencia => "Procedencia",
        :grupos_diplomado => nil,
        :documentos_validados => false
      )
    ])
  end

  it "renders a list of inscripcion_diplomados" do
    render
    assert_select "tr>td", :text => "Curp".to_s, :count => 2
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => "Paterno".to_s, :count => 2
    assert_select "tr>td", :text => "Materno".to_s, :count => 2
    assert_select "tr>td", :text => "Sexo".to_s, :count => 2
    assert_select "tr>td", :text => "Nacimiento".to_s, :count => 2
    assert_select "tr>td", :text => "Domicilio".to_s, :count => 2
    assert_select "tr>td", :text => "Codigo Postal".to_s, :count => 2
    assert_select "tr>td", :text => "Entidad".to_s, :count => 2
    assert_select "tr>td", :text => "Delegacion Municipio".to_s, :count => 2
    assert_select "tr>td", :text => "Telefono Celular".to_s, :count => 2
    assert_select "tr>td", :text => "Telefono Fijo".to_s, :count => 2
    assert_select "tr>td", :text => "Correo".to_s, :count => 2
    assert_select "tr>td", :text => "Procedencia".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
