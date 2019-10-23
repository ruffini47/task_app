require 'test_helper'

class GuestsControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get guests_login_url
    assert_response :success
  end

end
