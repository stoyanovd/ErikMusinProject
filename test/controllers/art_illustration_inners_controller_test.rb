require 'test_helper'

class ArtIllustrationInnersControllerTest < ActionController::TestCase
  setup do
    @art_illustration_inner = art_illustration_inners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:art_illustration_inners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create art_illustration_inner" do
    assert_difference('ArtIllustrationInner.count') do
      post :create, art_illustration_inner: { art_illustration_id: @art_illustration_inner.art_illustration_id, show_index: @art_illustration_inner.show_index }
    end

    assert_redirected_to art_illustration_inner_path(assigns(:art_illustration_inner))
  end

  test "should show art_illustration_inner" do
    get :show, id: @art_illustration_inner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @art_illustration_inner
    assert_response :success
  end

  test "should update art_illustration_inner" do
    patch :update, id: @art_illustration_inner, art_illustration_inner: { art_illustration_id: @art_illustration_inner.art_illustration_id, show_index: @art_illustration_inner.show_index }
    assert_redirected_to art_illustration_inner_path(assigns(:art_illustration_inner))
  end

  test "should destroy art_illustration_inner" do
    assert_difference('ArtIllustrationInner.count', -1) do
      delete :destroy, id: @art_illustration_inner
    end

    assert_redirected_to art_illustration_inners_path
  end
end
