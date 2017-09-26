require 'rails_helper'

RSpec.describe "unitarios/index", type: :view do
  before(:each) do
    assign(:unitarios, [
      Unitario.create!(
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
        :nombre_padre => "Nombre Padre",
        :correo_padre => "Correo Padre",
        :telefono_padre => "Telefono Padre"
      ),
      Unitario.create!(
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
        :nombre_padre => "Nombre Padre",
        :correo_padre => "Correo Padre",
        :telefono_padre => "Telefono Padre"
      )
    ])
  end

  it "renders a list of unitarios" do
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
    assert_select "tr>td", :text => "Nombre Padre".to_s, :count => 2
    assert_select "tr>td", :text => "Correo Padre".to_s, :count => 2
    assert_select "tr>td", :text => "Telefono Padre".to_s, :count => 2
  end
end
