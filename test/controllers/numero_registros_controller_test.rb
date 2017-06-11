require 'test_helper'

class NumeroRegistrosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @numero_registro = numero_registros(:one)
  end

  test "should get index" do
    get numero_registros_url
    assert_response :success
  end

  test "should get new" do
    get new_numero_registro_url
    assert_response :success
  end

  test "should create numero_registro" do
    assert_difference('NumeroRegistro.count') do
      post numero_registros_url, params: { numero_registro: { nombre: @numero_registro.nombre } }
    end

    assert_redirected_to numero_registro_url(NumeroRegistro.last)
  end

  test "should show numero_registro" do
    get numero_registro_url(@numero_registro)
    assert_response :success
  end

  test "should get edit" do
    get edit_numero_registro_url(@numero_registro)
    assert_response :success
  end

  test "should update numero_registro" do
    patch numero_registro_url(@numero_registro), params: { numero_registro: { nombre: @numero_registro.nombre } }
    assert_redirected_to numero_registro_url(@numero_registro)
  end

  test "should destroy numero_registro" do
    assert_difference('NumeroRegistro.count', -1) do
      delete numero_registro_url(@numero_registro)
    end

    assert_redirected_to numero_registros_url
  end
end
