require 'test_helper'

class TwilioControllerTest < ActionDispatch::IntegrationTest
  test "should get callback" do
    get twilio_callback_url
    assert_response :success
  end

end
