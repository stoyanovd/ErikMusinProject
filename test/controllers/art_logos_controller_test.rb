require 'test_helper'

class ArtLogosControllerTest < ActionController::TestCase
  setup do
    @art_logo = art_logos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:art_logos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create art_logo" do
    assert_difference('ArtLogo.count') do
      post :create, art_logo: { name: @art_logo.name, order: @art_logo.order }
    end

    assert_redirected_to art_logo_path(assigns(:art_logo))
  end

  test "should show art_logo" do
    get :show, id: @art_logo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @art_logo
    assert_response :success
  end

  test "should update art_logo" do
    patch :update, id: @art_logo, art_logo: { name: @art_logo.name, order: @art_logo.order }
    assert_redirected_to art_logo_path(assigns(:art_logo))
  end

  test "should destroy art_logo" do
    assert_difference('ArtLogo.count', -1) do
      delete :destroy, id: @art_logo
    end

    assert_redirected_to art_logos_path
  end
end
