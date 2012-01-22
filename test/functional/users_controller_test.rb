require 'test_helper'

class UsersControllerTest < ActionController::TestCase
	
  setup do
    @user = users(:one)
    @update = {
  		username: "MyUsername",
  		name: "MyString",
  		email: "MyString@test.com",
  		password: "MyString",
  		password_confirmation: "MyString"  		
  	}
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
    assert_select 'h1', 'Users'
    assert_select 'td', { text: /MyGroup?/, minimum: 1 }, 'index did not return at least one td with a known group name in it'
  end

  test "should get index and display flash message" do
    get :index, nil, nil, notice: 'flash message'
    assert_response :success
    assert_not_nil assigns(:users)
    assert_equal 'flash message', flash[:notice]
    assert_select '#notice', 'flash message'
  end  
  
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: @update
    end

    assert_redirected_to users_path
  end

  test "should show user" do
    get :show, id: @user.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user.to_param
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user.to_param, user: @update
    assert_redirected_to users_path
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user.to_param
    end

    assert_redirected_to users_path
  end
end
