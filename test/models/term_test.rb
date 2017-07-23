require 'test_helper'

class TermTest < ActiveSupport::TestCase
  def setup
    stub_request(:get, "http://api.uwaterloo.ca/v2/terms/list.json").
      with(body: %Q('data': {
            'current_term': 1139,
            'previous_term': 1135,
            'next_term': 1141
      }))

  end
  test "Term#current_term returns the current term" do
    assert_equal "Spring 2017", Term.current_term
  end
end
