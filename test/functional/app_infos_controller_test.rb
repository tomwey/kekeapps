require 'test_helper'

class AppInfosControllerTest < ActionController::TestCase
  setup do
    @app_info = app_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:app_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create app_info" do
    assert_difference('AppInfo.count') do
      post :create, app_info: { app_url: @app_info.app_url, description: @app_info.description, title: @app_info.title }
    end

    assert_redirected_to app_info_path(assigns(:app_info))
  end

  test "should show app_info" do
    get :show, id: @app_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @app_info
    assert_response :success
  end

  test "should update app_info" do
    put :update, id: @app_info, app_info: { app_url: @app_info.app_url, description: @app_info.description, title: @app_info.title }
    assert_redirected_to app_info_path(assigns(:app_info))
  end

  test "should destroy app_info" do
    assert_difference('AppInfo.count', -1) do
      delete :destroy, id: @app_info
    end

    assert_redirected_to app_infos_path
  end
end
