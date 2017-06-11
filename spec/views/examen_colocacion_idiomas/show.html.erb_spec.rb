require 'rails_helper'

RSpec.describe "examen_colocacion_idiomas/show", type: :view do
  before(:each) do
    @examen_colocacion_idioma = assign(:examen_colocacion_idioma, ExamenColocacionIdioma.create!(
      :nombre => "Nombre",
      :paterno => "Paterno",
      :materno => "Materno",
      :idioma => "Idioma",
      :nivel_asignado => "Nivel Asignado",
      :examinador => "Examinador"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(/Paterno/)
    expect(rendered).to match(/Materno/)
    expect(rendered).to match(/Idioma/)
    expect(rendered).to match(/Nivel Asignado/)
    expect(rendered).to match(/Examinador/)
  end
end
