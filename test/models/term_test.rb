require 'test_helper'

class TermTest < ActiveSupport::TestCase
  def setup
    stub_term
  end

  test "#new creates a new record for the current term using the api" do
    assert_difference 'Term.count' do
      Term.create
    end
  end
end
