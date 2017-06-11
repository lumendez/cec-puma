require 'test_helper'

class CuotaCursosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cuota_curso = cuota_cursos(:one)
  end

  test "should get index" do
    get cuota_cursos_url
    assert_response :success
  end

  test "should get new" do
    get new_cuota_curso_url
    assert_response :success
  end

  test "should create cuota_curso" do
    assert_difference('CuotaCurso.count') do
      post cuota_cursos_url, params: { cuota_curso: { nombre: @cuota_curso.nombre } }
    end

    assert_redirected_to cuota_curso_url(CuotaCurso.last)
  end

  test "should show cuota_curso" do
    get cuota_curso_url(@cuota_curso)
    assert_response :success
  end

  test "should get edit" do
    get edit_cuota_curso_url(@cuota_curso)
    assert_response :success
  end

  test "should update cuota_curso" do
    patch cuota_curso_url(@cuota_curso), params: { cuota_curso: { nombre: @cuota_curso.nombre } }
    assert_redirected_to cuota_curso_url(@cuota_curso)
  end

  test "should destroy cuota_curso" do
    assert_difference('CuotaCurso.count', -1) do
      delete cuota_curso_url(@cuota_curso)
    end

    assert_redirected_to cuota_cursos_url
  end
end
