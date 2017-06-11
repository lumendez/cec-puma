require 'test_helper'

class ClaveCatalogosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clave_catalogo = clave_catalogos(:one)
  end

  test "should get index" do
    get clave_catalogos_url
    assert_response :success
  end

  test "should get new" do
    get new_clave_catalogo_url
    assert_response :success
  end

  test "should create clave_catalogo" do
    assert_difference('ClaveCatalogo.count') do
      post clave_catalogos_url, params: { clave_catalogo: { nombre: @clave_catalogo.nombre } }
    end

    assert_redirected_to clave_catalogo_url(ClaveCatalogo.last)
  end

  test "should show clave_catalogo" do
    get clave_catalogo_url(@clave_catalogo)
    assert_response :success
  end

  test "should get edit" do
    get edit_clave_catalogo_url(@clave_catalogo)
    assert_response :success
  end

  test "should update clave_catalogo" do
    patch clave_catalogo_url(@clave_catalogo), params: { clave_catalogo: { nombre: @clave_catalogo.nombre } }
    assert_redirected_to clave_catalogo_url(@clave_catalogo)
  end

  test "should destroy clave_catalogo" do
    assert_difference('ClaveCatalogo.count', -1) do
      delete clave_catalogo_url(@clave_catalogo)
    end

    assert_redirected_to clave_catalogos_url
  end
end
