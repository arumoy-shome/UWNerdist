require 'test_helper'

class TermTest < ActiveSupport::TestCase
  def setup
    stub_term
  end

  test "#new creates a new record for the current term using the api" do
    assert_difference 'Term.count' do
      Term.create
    end

    record = Term.first

    assert_equal 1139, record.id
    assert_equal 'Fall 2017', record.description
  end
end
