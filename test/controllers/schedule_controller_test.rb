require 'test_helper'

class ScheduleControllerTest < ActionDispatch::IntegrationTest
  test "GET #new renders the page" do
    get schedules_url

    assert_response :success
  end
end
