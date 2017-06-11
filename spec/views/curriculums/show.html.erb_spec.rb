require 'rails_helper'

RSpec.describe "curriculums/show", type: :view do
  before(:each) do
    @curriculum = assign(:curriculum, Curriculum.create!(
      :calle => "Calle",
      :colonia => "Colonia",
      :municipui => "Municipui",
      :entidad => "Entidad",
      :correo => "Correo",
      :telefono => "Telefono",
      :celular => "Celular",
      :lugar => "Lugar"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Calle/)
    expect(rendered).to match(/Colonia/)
    expect(rendered).to match(/Municipui/)
    expect(rendered).to match(/Entidad/)
    expect(rendered).to match(/Correo/)
    expect(rendered).to match(/Telefono/)
    expect(rendered).to match(/Celular/)
    expect(rendered).to match(/Lugar/)
  end
end
