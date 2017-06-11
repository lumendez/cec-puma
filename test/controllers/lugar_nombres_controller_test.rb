require 'test_helper'

class LugarNombresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lugar_nombre = lugar_nombres(:one)
  end

  test "should get index" do
    get lugar_nombres_url
    assert_response :success
  end

  test "should get new" do
    get new_lugar_nombre_url
    assert_response :success
  end

  test "should create lugar_nombre" do
    assert_difference('LugarNombre.count') do
      post lugar_nombres_url, params: { lugar_nombre: { nombre: @lugar_nombre.nombre } }
    end

    assert_redirected_to lugar_nombre_url(LugarNombre.last)
  end

  test "should show lugar_nombre" do
    get lugar_nombre_url(@lugar_nombre)
    assert_response :success
  end

  test "should get edit" do
    get edit_lugar_nombre_url(@lugar_nombre)
    assert_response :success
  end

  test "should update lugar_nombre" do
    patch lugar_nombre_url(@lugar_nombre), params: { lugar_nombre: { nombre: @lugar_nombre.nombre } }
    assert_redirected_to lugar_nombre_url(@lugar_nombre)
  end

  test "should destroy lugar_nombre" do
    assert_difference('LugarNombre.count', -1) do
      delete lugar_nombre_url(@lugar_nombre)
    end

    assert_redirected_to lugar_nombres_url
  end
end
