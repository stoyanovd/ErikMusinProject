require 'test_helper'

class ArtLetteringsControllerTest < ActionController::TestCase
  setup do
    @art_lettering = art_letterings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:art_letterings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create art_lettering" do
    assert_difference('ArtLettering.count') do
      post :create, art_lettering: { name: @art_lettering.name, show_index: @art_lettering.show_index }
    end

    assert_redirected_to art_lettering_path(assigns(:art_lettering))
  end

  test "should show art_lettering" do
    get :show, id: @art_lettering
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @art_lettering
    assert_response :success
  end

  test "should update art_lettering" do
    patch :update, id: @art_lettering, art_lettering: { name: @art_lettering.name, show_index: @art_lettering.show_index }
    assert_redirected_to art_lettering_path(assigns(:art_lettering))
  end

  test "should destroy art_lettering" do
    assert_difference('ArtLettering.count', -1) do
      delete :destroy, id: @art_lettering
    end

    assert_redirected_to art_letterings_path
  end
end
