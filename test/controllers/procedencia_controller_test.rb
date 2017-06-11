require 'test_helper'

class ProcedenciaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @procedencium = procedencia(:one)
  end

  test "should get index" do
    get procedencia_url
    assert_response :success
  end

  test "should get new" do
    get new_procedencium_url
    assert_response :success
  end

  test "should create procedencium" do
    assert_difference('Procedencium.count') do
      post procedencia_url, params: { procedencium: { procedencia: @procedencium.procedencia } }
    end

    assert_redirected_to procedencium_url(Procedencium.last)
  end

  test "should show procedencium" do
    get procedencium_url(@procedencium)
    assert_response :success
  end

  test "should get edit" do
    get edit_procedencium_url(@procedencium)
    assert_response :success
  end

  test "should update procedencium" do
    patch procedencium_url(@procedencium), params: { procedencium: { procedencia: @procedencium.procedencia } }
    assert_redirected_to procedencium_url(@procedencium)
  end

  test "should destroy procedencium" do
    assert_difference('Procedencium.count', -1) do
      delete procedencium_url(@procedencium)
    end

    assert_redirected_to procedencia_url
  end
end
