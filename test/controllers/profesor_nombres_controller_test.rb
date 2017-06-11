require 'test_helper'

class ProfesorNombresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profesor_nombre = profesor_nombres(:one)
  end

  test "should get index" do
    get profesor_nombres_url
    assert_response :success
  end

  test "should get new" do
    get new_profesor_nombre_url
    assert_response :success
  end

  test "should create profesor_nombre" do
    assert_difference('ProfesorNombre.count') do
      post profesor_nombres_url, params: { profesor_nombre: { nombre: @profesor_nombre.nombre } }
    end

    assert_redirected_to profesor_nombre_url(ProfesorNombre.last)
  end

  test "should show profesor_nombre" do
    get profesor_nombre_url(@profesor_nombre)
    assert_response :success
  end

  test "should get edit" do
    get edit_profesor_nombre_url(@profesor_nombre)
    assert_response :success
  end

  test "should update profesor_nombre" do
    patch profesor_nombre_url(@profesor_nombre), params: { profesor_nombre: { nombre: @profesor_nombre.nombre } }
    assert_redirected_to profesor_nombre_url(@profesor_nombre)
  end

  test "should destroy profesor_nombre" do
    assert_difference('ProfesorNombre.count', -1) do
      delete profesor_nombre_url(@profesor_nombre)
    end

    assert_redirected_to profesor_nombres_url
  end
end
