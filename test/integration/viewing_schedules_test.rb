require 'test_helper'

class ViewingSchedulesTest < ActionDispatch::IntegrationTest
  def setup
    stub_term
  end

  test "index has a header" do
    get schedules_url

    assert_select 'h1', 'Welcome to UWNerdist'
  end

  test "index shows the current term" do
    get schedules_url

    assert_select 'h2', 'Current term: Fall 2017'
  end
end
