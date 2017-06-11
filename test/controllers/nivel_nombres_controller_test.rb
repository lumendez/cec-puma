require 'test_helper'

class NivelNombresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nivel_nombre = nivel_nombres(:one)
  end

  test "should get index" do
    get nivel_nombres_url
    assert_response :success
  end

  test "should get new" do
    get new_nivel_nombre_url
    assert_response :success
  end

  test "should create nivel_nombre" do
    assert_difference('NivelNombre.count') do
      post nivel_nombres_url, params: { nivel_nombre: { nivel: @nivel_nombre.nivel } }
    end

    assert_redirected_to nivel_nombre_url(NivelNombre.last)
  end

  test "should show nivel_nombre" do
    get nivel_nombre_url(@nivel_nombre)
    assert_response :success
  end

  test "should get edit" do
    get edit_nivel_nombre_url(@nivel_nombre)
    assert_response :success
  end

  test "should update nivel_nombre" do
    patch nivel_nombre_url(@nivel_nombre), params: { nivel_nombre: { nivel: @nivel_nombre.nivel } }
    assert_redirected_to nivel_nombre_url(@nivel_nombre)
  end

  test "should destroy nivel_nombre" do
    assert_difference('NivelNombre.count', -1) do
      delete nivel_nombre_url(@nivel_nombre)
    end

    assert_redirected_to nivel_nombres_url
  end
end
