require 'rails_helper'

RSpec.describe "seccion_nombres/new", type: :view do
  before(:each) do
    assign(:seccion_nombre, SeccionNombre.new(
      :nombre => "MyString"
    ))
  end

  it "renders new seccion_nombre form" do
    render

    assert_select "form[action=?][method=?]", seccion_nombres_path, "post" do

      assert_select "input#seccion_nombre_nombre[name=?]", "seccion_nombre[nombre]"
    end
  end
end
