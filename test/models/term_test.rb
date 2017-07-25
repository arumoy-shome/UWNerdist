require 'test_helper'
require 'json'

class TermTest < ActiveSupport::TestCase
  def setup
    stub_request(:get, "https://api.uwaterloo.ca/v2/terms/list.json?key=#{ENV['KEY']}").
      with(headers: stub_header ).
      to_return(status: 200, body: stub_body, headers: {})
  end

  test "Term#current_term returns the current term" do
    assert_equal "Fall 2017", Term.current_term
  end

  private

  def stub_header
    {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Ruby'
    }
  end

  def stub_body
    {
      'data': {
        'current_term': 1139,
        'previous_term': 1135,
        'next_term': 1141
      }
    }.to_json
  end
end
