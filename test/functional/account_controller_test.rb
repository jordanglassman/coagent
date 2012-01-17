require 'test_helper'

class AccountControllerTest < ActionController::TestCase
  test "should get settings" do
    get :settings
    assert_response :success
  end

  test "should get home" do
    get :home
    assert_response :success
  end

end
