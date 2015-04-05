require 'test_helper'

class ArtIllustrationsControllerTest < ActionController::TestCase
  setup do
    @art_illustration = art_illustrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:art_illustrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create art_illustration" do
    assert_difference('ArtIllustration.count') do
      post :create, art_illustration: { back_color: @art_illustration.back_color, name: @art_illustration.name, show_index: @art_illustration.show_index }
    end

    assert_redirected_to art_illustration_path(assigns(:art_illustration))
  end

  test "should show art_illustration" do
    get :show, id: @art_illustration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @art_illustration
    assert_response :success
  end

  test "should update art_illustration" do
    patch :update, id: @art_illustration, art_illustration: { back_color: @art_illustration.back_color, name: @art_illustration.name, show_index: @art_illustration.show_index }
    assert_redirected_to art_illustration_path(assigns(:art_illustration))
  end

  test "should destroy art_illustration" do
    assert_difference('ArtIllustration.count', -1) do
      delete :destroy, id: @art_illustration
    end

    assert_redirected_to art_illustrations_path
  end
end
