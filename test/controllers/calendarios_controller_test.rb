require 'test_helper'

class CalendariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @calendario = calendarios(:one)
  end

  test "should get index" do
    get calendarios_url
    assert_response :success
  end

  test "should get new" do
    get new_calendario_url
    assert_response :success
  end

  test "should create calendario" do
    assert_difference('Calendario.count') do
      post calendarios_url, params: { calendario: { entrega_boletas: @calendario.entrega_boletas, examen_colocacion: @calendario.examen_colocacion, examen_final: @calendario.examen_final, examen_medio: @calendario.examen_medio, inicio_curso: @calendario.inicio_curso, nombre: @calendario.nombre, registro: @calendario.registro, suspension_labores: @calendario.suspension_labores, vacaciones: @calendario.vacaciones } }
    end

    assert_redirected_to calendario_url(Calendario.last)
  end

  test "should show calendario" do
    get calendario_url(@calendario)
    assert_response :success
  end

  test "should get edit" do
    get edit_calendario_url(@calendario)
    assert_response :success
  end

  test "should update calendario" do
    patch calendario_url(@calendario), params: { calendario: { entrega_boletas: @calendario.entrega_boletas, examen_colocacion: @calendario.examen_colocacion, examen_final: @calendario.examen_final, examen_medio: @calendario.examen_medio, inicio_curso: @calendario.inicio_curso, nombre: @calendario.nombre, registro: @calendario.registro, suspension_labores: @calendario.suspension_labores, vacaciones: @calendario.vacaciones } }
    assert_redirected_to calendario_url(@calendario)
  end

  test "should destroy calendario" do
    assert_difference('Calendario.count', -1) do
      delete calendario_url(@calendario)
    end

    assert_redirected_to calendarios_url
  end
end
