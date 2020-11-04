require 'test_helper'

class TmpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tmp = tmps(:one)
  end

  test "should get index" do
    get tmps_url
    assert_response :success
  end

  test "should get new" do
    get new_tmp_url
    assert_response :success
  end

  test "should create tmp" do
    assert_difference('Tmp.count') do
      post tmps_url, params: { tmp: { age: @tmp.age, name: @tmp.name } }
    end

    assert_redirected_to tmp_url(Tmp.last)
  end

  test "should show tmp" do
    get tmp_url(@tmp)
    assert_response :success
  end

  test "should get edit" do
    get edit_tmp_url(@tmp)
    assert_response :success
  end

  test "should update tmp" do
    patch tmp_url(@tmp), params: { tmp: { age: @tmp.age, name: @tmp.name } }
    assert_redirected_to tmp_url(@tmp)
  end

  test "should destroy tmp" do
    assert_difference('Tmp.count', -1) do
      delete tmp_url(@tmp)
    end

    assert_redirected_to tmps_url
  end
end
