require 'test_helper'

class LetteringsControllerTest < ActionController::TestCase
  setup do
    @lettering = letterings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:letterings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lettering" do
    assert_difference('Lettering.count') do
      post :create, lettering: { name: @lettering.name }
    end

    assert_redirected_to lettering_path(assigns(:lettering))
  end

  test "should show lettering" do
    get :show, id: @lettering
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lettering
    assert_response :success
  end

  test "should update lettering" do
    patch :update, id: @lettering, lettering: { name: @lettering.name }
    assert_redirected_to lettering_path(assigns(:lettering))
  end

  test "should destroy lettering" do
    assert_difference('Lettering.count', -1) do
      delete :destroy, id: @lettering
    end

    assert_redirected_to letterings_path
  end
end
