require 'rails_helper'

RSpec.describe "curriculums/index", type: :view do
  before(:each) do
    assign(:curriculums, [
      Curriculum.create!(
        :calle => "Calle",
        :colonia => "Colonia",
        :municipui => "Municipui",
        :entidad => "Entidad",
        :correo => "Correo",
        :telefono => "Telefono",
        :celular => "Celular",
        :lugar => "Lugar"
      ),
      Curriculum.create!(
        :calle => "Calle",
        :colonia => "Colonia",
        :municipui => "Municipui",
        :entidad => "Entidad",
        :correo => "Correo",
        :telefono => "Telefono",
        :celular => "Celular",
        :lugar => "Lugar"
      )
    ])
  end

  it "renders a list of curriculums" do
    render
    assert_select "tr>td", :text => "Calle".to_s, :count => 2
    assert_select "tr>td", :text => "Colonia".to_s, :count => 2
    assert_select "tr>td", :text => "Municipui".to_s, :count => 2
    assert_select "tr>td", :text => "Entidad".to_s, :count => 2
    assert_select "tr>td", :text => "Correo".to_s, :count => 2
    assert_select "tr>td", :text => "Telefono".to_s, :count => 2
    assert_select "tr>td", :text => "Celular".to_s, :count => 2
    assert_select "tr>td", :text => "Lugar".to_s, :count => 2
  end
end
