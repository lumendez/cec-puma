require 'rails_helper'

RSpec.describe "diplomados/show", type: :view do
  before(:each) do
    @diplomado = assign(:diplomado, Diplomado.create!(
      :nombre => "Nombre",
      :dependencia => "Dependencia",
      :sede => "Sede",
      :registro => "Registro",
      :inicio => "Inicio",
      :termino => "Termino",
      :horario => "Horario"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(/Dependencia/)
    expect(rendered).to match(/Sede/)
    expect(rendered).to match(/Registro/)
    expect(rendered).to match(/Inicio/)
    expect(rendered).to match(/Termino/)
    expect(rendered).to match(/Horario/)
  end
end
