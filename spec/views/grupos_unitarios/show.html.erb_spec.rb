require 'rails_helper'

RSpec.describe "grupos_unitarios/show", type: :view do
  before(:each) do
    @grupos_unitario = assign(:grupos_unitario, GruposUnitario.create!(
      :nombre => "Nombre",
      :horario => "Horario",
      :estado => "Estado",
      :anio => "Anio",
      :periodo => "Periodo",
      :lugar => "Lugar",
      :fecha => "Fecha",
      :centro => "Centro",
      :tipo => "Tipo",
      :modalidad => "Modalidad",
      :cupo => "Cupo",
      :duracion => "Duracion",
      :cuota => "Cuota",
      :clave => "Clave",
      :proyecto => "Proyecto",
      :institucion_bancaria => "Institucion Bancaria",
      :cuenta => "Cuenta",
      :titular => "Titular",
      :jefe_ec => "Jefe Ec",
      :registro => "Registro",
      :referencia => "Referencia",
      :habilitar_constancias_grupo => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(/Horario/)
    expect(rendered).to match(/Estado/)
    expect(rendered).to match(/Anio/)
    expect(rendered).to match(/Periodo/)
    expect(rendered).to match(/Lugar/)
    expect(rendered).to match(/Fecha/)
    expect(rendered).to match(/Centro/)
    expect(rendered).to match(/Tipo/)
    expect(rendered).to match(/Modalidad/)
    expect(rendered).to match(/Cupo/)
    expect(rendered).to match(/Duracion/)
    expect(rendered).to match(/Cuota/)
    expect(rendered).to match(/Clave/)
    expect(rendered).to match(/Proyecto/)
    expect(rendered).to match(/Institucion Bancaria/)
    expect(rendered).to match(/Cuenta/)
    expect(rendered).to match(/Titular/)
    expect(rendered).to match(/Jefe Ec/)
    expect(rendered).to match(/Registro/)
    expect(rendered).to match(/Referencia/)
    expect(rendered).to match(/false/)
  end
end
