require 'test_helper'

class ModalidadOfertaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @modalidad_ofertum = modalidad_oferta(:one)
  end

  test "should get index" do
    get modalidad_oferta_url
    assert_response :success
  end

  test "should get new" do
    get new_modalidad_ofertum_url
    assert_response :success
  end

  test "should create modalidad_ofertum" do
    assert_difference('ModalidadOfertum.count') do
      post modalidad_oferta_url, params: { modalidad_ofertum: { nombre: @modalidad_ofertum.nombre } }
    end

    assert_redirected_to modalidad_ofertum_url(ModalidadOfertum.last)
  end

  test "should show modalidad_ofertum" do
    get modalidad_ofertum_url(@modalidad_ofertum)
    assert_response :success
  end

  test "should get edit" do
    get edit_modalidad_ofertum_url(@modalidad_ofertum)
    assert_response :success
  end

  test "should update modalidad_ofertum" do
    patch modalidad_ofertum_url(@modalidad_ofertum), params: { modalidad_ofertum: { nombre: @modalidad_ofertum.nombre } }
    assert_redirected_to modalidad_ofertum_url(@modalidad_ofertum)
  end

  test "should destroy modalidad_ofertum" do
    assert_difference('ModalidadOfertum.count', -1) do
      delete modalidad_ofertum_url(@modalidad_ofertum)
    end

    assert_redirected_to modalidad_oferta_url
  end
end
