require 'rails_helper'

RSpec.describe "seccion_nombres/edit", type: :view do
  before(:each) do
    @seccion_nombre = assign(:seccion_nombre, SeccionNombre.create!(
      :nombre => "MyString"
    ))
  end

  it "renders the edit seccion_nombre form" do
    render

    assert_select "form[action=?][method=?]", seccion_nombre_path(@seccion_nombre), "post" do

      assert_select "input#seccion_nombre_nombre[name=?]", "seccion_nombre[nombre]"
    end
  end
end
