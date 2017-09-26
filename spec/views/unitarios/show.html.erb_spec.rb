require 'rails_helper'

RSpec.describe "unitarios/show", type: :view do
  before(:each) do
    @unitario = assign(:unitario, Unitario.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Curp/)
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(/Paterno/)
    expect(rendered).to match(/Materno/)
    expect(rendered).to match(/Sexo/)
    expect(rendered).to match(/Nacimiento/)
    expect(rendered).to match(/Domicilio/)
    expect(rendered).to match(/Codigo Postal/)
    expect(rendered).to match(/Entidad/)
    expect(rendered).to match(/Delegacion Municipio/)
    expect(rendered).to match(/Telefono Celular/)
    expect(rendered).to match(/Telefono Fijo/)
    expect(rendered).to match(/Correo/)
    expect(rendered).to match(/Procedencia/)
    expect(rendered).to match(/Nombre Padre/)
    expect(rendered).to match(/Correo Padre/)
    expect(rendered).to match(/Telefono Padre/)
  end
end
