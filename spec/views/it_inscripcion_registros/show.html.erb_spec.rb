require 'rails_helper'

RSpec.describe "it_inscripcion_registros/show", type: :view do
  before(:each) do
    @it_inscripcion_registro = assign(:it_inscripcion_registro, ItInscripcionRegistro.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(/Paterno/)
    expect(rendered).to match(/Materno/)
    expect(rendered).to match(/Idioma/)
    expect(rendered).to match(/Horario/)
    expect(rendered).to match(/Nivel/)
    expect(rendered).to match(/Curso/)
    expect(rendered).to match(/Opcion Uno/)
    expect(rendered).to match(/Opcion Dos/)
    expect(rendered).to match(/Telefono/)
    expect(rendered).to match(/Periodo/)
    expect(rendered).to match(/Correo/)
    expect(rendered).to match(/Sexo/)
    expect(rendered).to match(/Cuota/)
    expect(rendered).to match(/Movimiento/)
    expect(rendered).to match(/Procedencia/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Boleta/)
    expect(rendered).to match(/Oferta Grupo/)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Oficio Prestacion/)
    expect(rendered).to match(/Monto Pagado/)
  end
end
