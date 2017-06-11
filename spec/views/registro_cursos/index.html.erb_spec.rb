require 'rails_helper'

RSpec.describe "registro_cursos/index", type: :view do
  before(:each) do
    assign(:registro_cursos, [
      RegistroCurso.create!(
        :nombre => "Nombre",
        :horas => "Horas",
        :periodo => "Periodo",
        :temas => "Temas",
        :instructor => "Instructor"
      ),
      RegistroCurso.create!(
        :nombre => "Nombre",
        :horas => "Horas",
        :periodo => "Periodo",
        :temas => "Temas",
        :instructor => "Instructor"
      )
    ])
  end

  it "renders a list of registro_cursos" do
    render
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => "Horas".to_s, :count => 2
    assert_select "tr>td", :text => "Periodo".to_s, :count => 2
    assert_select "tr>td", :text => "Temas".to_s, :count => 2
    assert_select "tr>td", :text => "Instructor".to_s, :count => 2
  end
end
