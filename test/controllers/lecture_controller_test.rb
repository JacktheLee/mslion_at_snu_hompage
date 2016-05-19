require 'test_helper'

class LectureControllerTest < ActionController::TestCase
  test "should get lecture" do
    get :lecture
    assert_response :success
  end

end
