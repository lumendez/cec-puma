require 'test_helper'

class TipoOfertaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_ofertum = tipo_oferta(:one)
  end

  test "should get index" do
    get tipo_oferta_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_ofertum_url
    assert_response :success
  end

  test "should create tipo_ofertum" do
    assert_difference('TipoOfertum.count') do
      post tipo_oferta_url, params: { tipo_ofertum: { nombre: @tipo_ofertum.nombre } }
    end

    assert_redirected_to tipo_ofertum_url(TipoOfertum.last)
  end

  test "should show tipo_ofertum" do
    get tipo_ofertum_url(@tipo_ofertum)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_ofertum_url(@tipo_ofertum)
    assert_response :success
  end

  test "should update tipo_ofertum" do
    patch tipo_ofertum_url(@tipo_ofertum), params: { tipo_ofertum: { nombre: @tipo_ofertum.nombre } }
    assert_redirected_to tipo_ofertum_url(@tipo_ofertum)
  end

  test "should destroy tipo_ofertum" do
    assert_difference('TipoOfertum.count', -1) do
      delete tipo_ofertum_url(@tipo_ofertum)
    end

    assert_redirected_to tipo_oferta_url
  end
end
