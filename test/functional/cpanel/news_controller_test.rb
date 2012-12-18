require 'test_helper'

class Cpanel::NewsControllerTest < ActionController::TestCase
  setup do
    @cpanel_news = cpanel_news(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cpanel_news)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cpanel_news" do
    assert_difference('Cpanel::News.count') do
      post :create, cpanel_news: {  }
    end

    assert_redirected_to cpanel_news_path(assigns(:cpanel_news))
  end

  test "should show cpanel_news" do
    get :show, id: @cpanel_news
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cpanel_news
    assert_response :success
  end

  test "should update cpanel_news" do
    put :update, id: @cpanel_news, cpanel_news: {  }
    assert_redirected_to cpanel_news_path(assigns(:cpanel_news))
  end

  test "should destroy cpanel_news" do
    assert_difference('Cpanel::News.count', -1) do
      delete :destroy, id: @cpanel_news
    end

    assert_redirected_to cpanel_news_index_path
  end
end
