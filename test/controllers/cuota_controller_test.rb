require 'test_helper'

class CuotaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cuotum = cuota(:one)
  end

  test "should get index" do
    get cuota_url
    assert_response :success
  end

  test "should get new" do
    get new_cuotum_url
    assert_response :success
  end

  test "should create cuotum" do
    assert_difference('Cuotum.count') do
      post cuota_url, params: { cuotum: { cuota: @cuotum.cuota } }
    end

    assert_redirected_to cuotum_url(Cuotum.last)
  end

  test "should show cuotum" do
    get cuotum_url(@cuotum)
    assert_response :success
  end

  test "should get edit" do
    get edit_cuotum_url(@cuotum)
    assert_response :success
  end

  test "should update cuotum" do
    patch cuotum_url(@cuotum), params: { cuotum: { cuota: @cuotum.cuota } }
    assert_redirected_to cuotum_url(@cuotum)
  end

  test "should destroy cuotum" do
    assert_difference('Cuotum.count', -1) do
      delete cuotum_url(@cuotum)
    end

    assert_redirected_to cuota_url
  end
end
