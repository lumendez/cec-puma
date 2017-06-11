require 'test_helper'

class DatosBancosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @datos_banco = datos_bancos(:one)
  end

  test "should get index" do
    get datos_bancos_url
    assert_response :success
  end

  test "should get new" do
    get new_datos_banco_url
    assert_response :success
  end

  test "should create datos_banco" do
    assert_difference('DatosBanco.count') do
      post datos_bancos_url, params: { datos_banco: { cuenta: @datos_banco.cuenta, nombre: @datos_banco.nombre, referencia: @datos_banco.referencia, titular: @datos_banco.titular } }
    end

    assert_redirected_to datos_banco_url(DatosBanco.last)
  end

  test "should show datos_banco" do
    get datos_banco_url(@datos_banco)
    assert_response :success
  end

  test "should get edit" do
    get edit_datos_banco_url(@datos_banco)
    assert_response :success
  end

  test "should update datos_banco" do
    patch datos_banco_url(@datos_banco), params: { datos_banco: { cuenta: @datos_banco.cuenta, nombre: @datos_banco.nombre, referencia: @datos_banco.referencia, titular: @datos_banco.titular } }
    assert_redirected_to datos_banco_url(@datos_banco)
  end

  test "should destroy datos_banco" do
    assert_difference('DatosBanco.count', -1) do
      delete datos_banco_url(@datos_banco)
    end

    assert_redirected_to datos_bancos_url
  end
end
