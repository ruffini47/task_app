require 'test_helper'

class GuestAdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get guest_admins_login_url
    assert_response :success
  end

end
