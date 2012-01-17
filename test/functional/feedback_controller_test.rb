require 'test_helper'

class FeedbackControllerTest < ActionController::TestCase
  test "should get write" do
    get :write
    assert_response :success
  end

  test "should get send" do
    get :send
    assert_response :success
  end

end
