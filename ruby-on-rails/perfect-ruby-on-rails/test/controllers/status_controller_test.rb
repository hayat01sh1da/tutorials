class StatusControllerTest < ApplicationControllerTest
  test "GET /status" do
    get '/status'

    assert_nothing_raised do
      assert_response :success
      assert_equal 'application/json', @response.media_type
    end
  end
end
