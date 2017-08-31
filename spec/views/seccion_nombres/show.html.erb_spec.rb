require 'rails_helper'

RSpec.describe "seccion_nombres/show", type: :view do
  before(:each) do
    @seccion_nombre = assign(:seccion_nombre, SeccionNombre.create!(
      :nombre => "Nombre"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
  end
end
