require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get :new," do
    get rooms_:new,_url
    assert_response :success
  end

  test "should get :create," do
    get rooms_:create,_url
    assert_response :success
  end

  test "should get :show," do
    get rooms_:show,_url
    assert_response :success
  end

  test "should get :index," do
    get rooms_:index,_url
    assert_response :success
  end

  test "should get :edit," do
    get rooms_:edit,_url
    assert_response :success
  end

  test "should get :update," do
    get rooms_:update,_url
    assert_response :success
  end

  test "should get :destroy" do
    get rooms_:destroy_url
    assert_response :success
  end

end
