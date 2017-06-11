require 'test_helper'

class AperturaGruposControllerTest < ActionDispatch::IntegrationTest
  setup do
    @apertura_grupo = apertura_grupos(:one)
  end

  test "should get index" do
    get apertura_grupos_url
    assert_response :success
  end

  test "should get new" do
    get new_apertura_grupo_url
    assert_response :success
  end

  test "should create apertura_grupo" do
    assert_difference('AperturaGrupo.count') do
      post apertura_grupos_url, params: { apertura_grupo: { centro: @apertura_grupo.centro, clave: @apertura_grupo.clave, cuenta: @apertura_grupo.cuenta, cuota: @apertura_grupo.cuota, cupo: @apertura_grupo.cupo, duracion: @apertura_grupo.duracion, fecha: @apertura_grupo.fecha, grupo: @apertura_grupo.grupo, horario: @apertura_grupo.horario, institucion_bancaria: @apertura_grupo.institucion_bancaria, instructor: @apertura_grupo.instructor, instructor_correo: @apertura_grupo.instructor_correo, instructor_rfc: @apertura_grupo.instructor_rfc, jefe_ec: @apertura_grupo.jefe_ec, lugar: @apertura_grupo.lugar, materia: @apertura_grupo.materia, modalidad: @apertura_grupo.modalidad, nombre: @apertura_grupo.nombre, periodo: @apertura_grupo.periodo, proyecto: @apertura_grupo.proyecto, referencia: @apertura_grupo.referencia, registro: @apertura_grupo.registro, tipo: @apertura_grupo.tipo, titutlar: @apertura_grupo.titutlar } }
    end

    assert_redirected_to apertura_grupo_url(AperturaGrupo.last)
  end

  test "should show apertura_grupo" do
    get apertura_grupo_url(@apertura_grupo)
    assert_response :success
  end

  test "should get edit" do
    get edit_apertura_grupo_url(@apertura_grupo)
    assert_response :success
  end

  test "should update apertura_grupo" do
    patch apertura_grupo_url(@apertura_grupo), params: { apertura_grupo: { centro: @apertura_grupo.centro, clave: @apertura_grupo.clave, cuenta: @apertura_grupo.cuenta, cuota: @apertura_grupo.cuota, cupo: @apertura_grupo.cupo, duracion: @apertura_grupo.duracion, fecha: @apertura_grupo.fecha, grupo: @apertura_grupo.grupo, horario: @apertura_grupo.horario, institucion_bancaria: @apertura_grupo.institucion_bancaria, instructor: @apertura_grupo.instructor, instructor_correo: @apertura_grupo.instructor_correo, instructor_rfc: @apertura_grupo.instructor_rfc, jefe_ec: @apertura_grupo.jefe_ec, lugar: @apertura_grupo.lugar, materia: @apertura_grupo.materia, modalidad: @apertura_grupo.modalidad, nombre: @apertura_grupo.nombre, periodo: @apertura_grupo.periodo, proyecto: @apertura_grupo.proyecto, referencia: @apertura_grupo.referencia, registro: @apertura_grupo.registro, tipo: @apertura_grupo.tipo, titutlar: @apertura_grupo.titutlar } }
    assert_redirected_to apertura_grupo_url(@apertura_grupo)
  end

  test "should destroy apertura_grupo" do
    assert_difference('AperturaGrupo.count', -1) do
      delete apertura_grupo_url(@apertura_grupo)
    end

    assert_redirected_to apertura_grupos_url
  end
end
