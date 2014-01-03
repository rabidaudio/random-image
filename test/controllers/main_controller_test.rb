require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get rand" do
    get :rand
    assert_response :success
  end

end
