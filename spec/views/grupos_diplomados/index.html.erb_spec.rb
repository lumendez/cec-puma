require 'rails_helper'

RSpec.describe "grupos_diplomados/index", type: :view do
  before(:each) do
    assign(:grupos_diplomados, [
      GruposDiplomado.create!(
        :nombre => "Nombre",
        :horario => "Horario",
        :estado => "Estado",
        :anio => "Anio",
        :inicio => "Inicio",
        :termino => "Termino",
        :horario => "Horario",
        :lugar => "Lugar",
        :fecha => "Fecha",
        :tipo => "Tipo",
        :modalidad => "Modalidad",
        :cupo => "Cupo",
        :duracion => "Duracion",
        :cuota => "Cuota",
        :clave => "Clave",
        :proyecto => "Proyecto",
        :institucion_bancaria => "Institucion Bancaria",
        :cuenta => "Cuenta",
        :titular => "Titular",
        :jefe_ec => "Jefe Ec",
        :registro => "Registro",
        :referencia => "Referencia",
        :habilitar_constancias => false
      ),
      GruposDiplomado.create!(
        :nombre => "Nombre",
        :horario => "Horario",
        :estado => "Estado",
        :anio => "Anio",
        :inicio => "Inicio",
        :termino => "Termino",
        :horario => "Horario",
        :lugar => "Lugar",
        :fecha => "Fecha",
        :tipo => "Tipo",
        :modalidad => "Modalidad",
        :cupo => "Cupo",
        :duracion => "Duracion",
        :cuota => "Cuota",
        :clave => "Clave",
        :proyecto => "Proyecto",
        :institucion_bancaria => "Institucion Bancaria",
        :cuenta => "Cuenta",
        :titular => "Titular",
        :jefe_ec => "Jefe Ec",
        :registro => "Registro",
        :referencia => "Referencia",
        :habilitar_constancias => false
      )
    ])
  end

  it "renders a list of grupos_diplomados" do
    render
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => "Horario".to_s, :count => 2
    assert_select "tr>td", :text => "Estado".to_s, :count => 2
    assert_select "tr>td", :text => "Anio".to_s, :count => 2
    assert_select "tr>td", :text => "Inicio".to_s, :count => 2
    assert_select "tr>td", :text => "Termino".to_s, :count => 2
    assert_select "tr>td", :text => "Horario".to_s, :count => 2
    assert_select "tr>td", :text => "Lugar".to_s, :count => 2
    assert_select "tr>td", :text => "Fecha".to_s, :count => 2
    assert_select "tr>td", :text => "Tipo".to_s, :count => 2
    assert_select "tr>td", :text => "Modalidad".to_s, :count => 2
    assert_select "tr>td", :text => "Cupo".to_s, :count => 2
    assert_select "tr>td", :text => "Duracion".to_s, :count => 2
    assert_select "tr>td", :text => "Cuota".to_s, :count => 2
    assert_select "tr>td", :text => "Clave".to_s, :count => 2
    assert_select "tr>td", :text => "Proyecto".to_s, :count => 2
    assert_select "tr>td", :text => "Institucion Bancaria".to_s, :count => 2
    assert_select "tr>td", :text => "Cuenta".to_s, :count => 2
    assert_select "tr>td", :text => "Titular".to_s, :count => 2
    assert_select "tr>td", :text => "Jefe Ec".to_s, :count => 2
    assert_select "tr>td", :text => "Registro".to_s, :count => 2
    assert_select "tr>td", :text => "Referencia".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
