require 'rails_helper'

RSpec.describe "registro_cursos/edit", type: :view do
  before(:each) do
    @registro_curso = assign(:registro_curso, RegistroCurso.create!(
      :nombre => "MyString",
      :horas => "MyString",
      :periodo => "MyString",
      :temas => "MyString",
      :instructor => "MyString"
    ))
  end

  it "renders the edit registro_curso form" do
    render

    assert_select "form[action=?][method=?]", registro_curso_path(@registro_curso), "post" do

      assert_select "input#registro_curso_nombre[name=?]", "registro_curso[nombre]"

      assert_select "input#registro_curso_horas[name=?]", "registro_curso[horas]"

      assert_select "input#registro_curso_periodo[name=?]", "registro_curso[periodo]"

      assert_select "input#registro_curso_temas[name=?]", "registro_curso[temas]"

      assert_select "input#registro_curso_instructor[name=?]", "registro_curso[instructor]"
    end
  end
end
