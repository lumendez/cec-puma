require 'rails_helper'

RSpec.describe "diplomados/index", type: :view do
  before(:each) do
    assign(:diplomados, [
      Diplomado.create!(
        :nombre => "Nombre",
        :dependencia => "Dependencia",
        :sede => "Sede",
        :registro => "Registro",
        :inicio => "Inicio",
        :termino => "Termino",
        :horario => "Horario"
      ),
      Diplomado.create!(
        :nombre => "Nombre",
        :dependencia => "Dependencia",
        :sede => "Sede",
        :registro => "Registro",
        :inicio => "Inicio",
        :termino => "Termino",
        :horario => "Horario"
      )
    ])
  end

  it "renders a list of diplomados" do
    render
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => "Dependencia".to_s, :count => 2
    assert_select "tr>td", :text => "Sede".to_s, :count => 2
    assert_select "tr>td", :text => "Registro".to_s, :count => 2
    assert_select "tr>td", :text => "Inicio".to_s, :count => 2
    assert_select "tr>td", :text => "Termino".to_s, :count => 2
    assert_select "tr>td", :text => "Horario".to_s, :count => 2
  end
end
