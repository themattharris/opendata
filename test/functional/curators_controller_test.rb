require 'test_helper'

class CuratorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:curators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create curator" do
    assert_difference('Curator.count') do
      post :create, :curator => { }
    end

    assert_redirected_to curator_path(assigns(:curator))
  end

  test "should show curator" do
    get :show, :id => curators(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => curators(:one).to_param
    assert_response :success
  end

  test "should update curator" do
    put :update, :id => curators(:one).to_param, :curator => { }
    assert_redirected_to curator_path(assigns(:curator))
  end

  test "should destroy curator" do
    assert_difference('Curator.count', -1) do
      delete :destroy, :id => curators(:one).to_param
    end

    assert_redirected_to curators_path
  end
end
