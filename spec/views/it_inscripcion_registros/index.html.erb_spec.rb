require 'rails_helper'

RSpec.describe "it_inscripcion_registros/index", type: :view do
  before(:each) do
    assign(:it_inscripcion_registros, [
      ItInscripcionRegistro.create!(
        :nombre => "Nombre",
        :paterno => "Paterno",
        :materno => "Materno",
        :idioma => "Idioma",
        :horario => "Horario",
        :nivel => "Nivel",
        :curso => "Curso",
        :opcion_uno => "Opcion Uno",
        :opcion_dos => "Opcion Dos",
        :telefono => "Telefono",
        :periodo => "Periodo",
        :correo => "Correo",
        :sexo => "Sexo",
        :cuota => "Cuota",
        :movimiento => "Movimiento",
        :procedencia => "Procedencia",
        :grupo => nil,
        :examen_medio => 2,
        :examen_final => 3,
        :documentos_validados => false,
        :boleta => "Boleta",
        :oferta_grupo => "Oferta Grupo",
        :user => nil,
        :habilitar_constancia => false,
        :habilitar_historial => false,
        :oficio_prestacion => "Oficio Prestacion",
        :monto_pagado => "Monto Pagado"
      ),
      ItInscripcionRegistro.create!(
        :nombre => "Nombre",
        :paterno => "Paterno",
        :materno => "Materno",
        :idioma => "Idioma",
        :horario => "Horario",
        :nivel => "Nivel",
        :curso => "Curso",
        :opcion_uno => "Opcion Uno",
        :opcion_dos => "Opcion Dos",
        :telefono => "Telefono",
        :periodo => "Periodo",
        :correo => "Correo",
        :sexo => "Sexo",
        :cuota => "Cuota",
        :movimiento => "Movimiento",
        :procedencia => "Procedencia",
        :grupo => nil,
        :examen_medio => 2,
        :examen_final => 3,
        :documentos_validados => false,
        :boleta => "Boleta",
        :oferta_grupo => "Oferta Grupo",
        :user => nil,
        :habilitar_constancia => false,
        :habilitar_historial => false,
        :oficio_prestacion => "Oficio Prestacion",
        :monto_pagado => "Monto Pagado"
      )
    ])
  end

  it "renders a list of it_inscripcion_registros" do
    render
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => "Paterno".to_s, :count => 2
    assert_select "tr>td", :text => "Materno".to_s, :count => 2
    assert_select "tr>td", :text => "Idioma".to_s, :count => 2
    assert_select "tr>td", :text => "Horario".to_s, :count => 2
    assert_select "tr>td", :text => "Nivel".to_s, :count => 2
    assert_select "tr>td", :text => "Curso".to_s, :count => 2
    assert_select "tr>td", :text => "Opcion Uno".to_s, :count => 2
    assert_select "tr>td", :text => "Opcion Dos".to_s, :count => 2
    assert_select "tr>td", :text => "Telefono".to_s, :count => 2
    assert_select "tr>td", :text => "Periodo".to_s, :count => 2
    assert_select "tr>td", :text => "Correo".to_s, :count => 2
    assert_select "tr>td", :text => "Sexo".to_s, :count => 2
    assert_select "tr>td", :text => "Cuota".to_s, :count => 2
    assert_select "tr>td", :text => "Movimiento".to_s, :count => 2
    assert_select "tr>td", :text => "Procedencia".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Boleta".to_s, :count => 2
    assert_select "tr>td", :text => "Oferta Grupo".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Oficio Prestacion".to_s, :count => 2
    assert_select "tr>td", :text => "Monto Pagado".to_s, :count => 2
  end
end
