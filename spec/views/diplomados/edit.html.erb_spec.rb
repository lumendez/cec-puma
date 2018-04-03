require 'rails_helper'

RSpec.describe "diplomados/edit", type: :view do
  before(:each) do
    @diplomado = assign(:diplomado, Diplomado.create!(
      :nombre => "MyString",
      :dependencia => "MyString",
      :sede => "MyString",
      :registro => "MyString",
      :inicio => "MyString",
      :termino => "MyString",
      :horario => "MyString"
    ))
  end

  it "renders the edit diplomado form" do
    render

    assert_select "form[action=?][method=?]", diplomado_path(@diplomado), "post" do

      assert_select "input#diplomado_nombre[name=?]", "diplomado[nombre]"

      assert_select "input#diplomado_dependencia[name=?]", "diplomado[dependencia]"

      assert_select "input#diplomado_sede[name=?]", "diplomado[sede]"

      assert_select "input#diplomado_registro[name=?]", "diplomado[registro]"

      assert_select "input#diplomado_inicio[name=?]", "diplomado[inicio]"

      assert_select "input#diplomado_termino[name=?]", "diplomado[termino]"

      assert_select "input#diplomado_horario[name=?]", "diplomado[horario]"
    end
  end
end
