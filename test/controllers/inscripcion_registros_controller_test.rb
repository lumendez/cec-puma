require 'test_helper'

class InscripcionRegistrosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inscripcion_registro = inscripcion_registros(:one)
  end

  test "should get index" do
    get inscripcion_registros_url
    assert_response :success
  end

  test "should get new" do
    get new_inscripcion_registro_url
    assert_response :success
  end

  test "should create inscripcion_registro" do
    assert_difference('InscripcionRegistro.count') do
      post inscripcion_registros_url, params: { inscripcion_registro: { correo: @inscripcion_registro.correo, cuota: @inscripcion_registro.cuota, curso: @inscripcion_registro.curso, horario: @inscripcion_registro.horario, idioma: @inscripcion_registro.idioma, movimiento: @inscripcion_registro.movimiento, nivel: @inscripcion_registro.nivel, nombre: @inscripcion_registro.nombre, opcion_dos: @inscripcion_registro.opcion_dos, opcion_uno: @inscripcion_registro.opcion_uno, periodo: @inscripcion_registro.periodo, procedencia: @inscripcion_registro.procedencia, sexo: @inscripcion_registro.sexo, telefono: @inscripcion_registro.telefono } }
    end

    assert_redirected_to inscripcion_registro_url(InscripcionRegistro.last)
  end

  test "should show inscripcion_registro" do
    get inscripcion_registro_url(@inscripcion_registro)
    assert_response :success
  end

  test "should get edit" do
    get edit_inscripcion_registro_url(@inscripcion_registro)
    assert_response :success
  end

  test "should update inscripcion_registro" do
    patch inscripcion_registro_url(@inscripcion_registro), params: { inscripcion_registro: { correo: @inscripcion_registro.correo, cuota: @inscripcion_registro.cuota, curso: @inscripcion_registro.curso, horario: @inscripcion_registro.horario, idioma: @inscripcion_registro.idioma, movimiento: @inscripcion_registro.movimiento, nivel: @inscripcion_registro.nivel, nombre: @inscripcion_registro.nombre, opcion_dos: @inscripcion_registro.opcion_dos, opcion_uno: @inscripcion_registro.opcion_uno, periodo: @inscripcion_registro.periodo, procedencia: @inscripcion_registro.procedencia, sexo: @inscripcion_registro.sexo, telefono: @inscripcion_registro.telefono } }
    assert_redirected_to inscripcion_registro_url(@inscripcion_registro)
  end

  test "should destroy inscripcion_registro" do
    assert_difference('InscripcionRegistro.count', -1) do
      delete inscripcion_registro_url(@inscripcion_registro)
    end

    assert_redirected_to inscripcion_registros_url
  end
end
