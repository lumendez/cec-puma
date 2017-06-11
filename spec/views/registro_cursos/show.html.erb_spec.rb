require 'rails_helper'

RSpec.describe "registro_cursos/show", type: :view do
  before(:each) do
    @registro_curso = assign(:registro_curso, RegistroCurso.create!(
      :nombre => "Nombre",
      :horas => "Horas",
      :periodo => "Periodo",
      :temas => "Temas",
      :instructor => "Instructor"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(/Horas/)
    expect(rendered).to match(/Periodo/)
    expect(rendered).to match(/Temas/)
    expect(rendered).to match(/Instructor/)
  end
end
