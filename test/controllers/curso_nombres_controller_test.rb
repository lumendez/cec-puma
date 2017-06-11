require 'test_helper'

class CursoNombresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @curso_nombre = curso_nombres(:one)
  end

  test "should get index" do
    get curso_nombres_url
    assert_response :success
  end

  test "should get new" do
    get new_curso_nombre_url
    assert_response :success
  end

  test "should create curso_nombre" do
    assert_difference('CursoNombre.count') do
      post curso_nombres_url, params: { curso_nombre: { nombre: @curso_nombre.nombre } }
    end

    assert_redirected_to curso_nombre_url(CursoNombre.last)
  end

  test "should show curso_nombre" do
    get curso_nombre_url(@curso_nombre)
    assert_response :success
  end

  test "should get edit" do
    get edit_curso_nombre_url(@curso_nombre)
    assert_response :success
  end

  test "should update curso_nombre" do
    patch curso_nombre_url(@curso_nombre), params: { curso_nombre: { nombre: @curso_nombre.nombre } }
    assert_redirected_to curso_nombre_url(@curso_nombre)
  end

  test "should destroy curso_nombre" do
    assert_difference('CursoNombre.count', -1) do
      delete curso_nombre_url(@curso_nombre)
    end

    assert_redirected_to curso_nombres_url
  end
end
