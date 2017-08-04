require 'test_helper'

class TermTest < ActiveSupport::TestCase
  def setup
    stub_term
  end

  test "#create creates a new record for the current term using the api" do
    assert_difference 'Term.count' do
      Term.create
    end

    record = Term.find(1234)

    assert_equal 1234, record.id
    assert_equal 'Winter 2013', record.description
  end

  test "#current returns the record for current term" do
    Term.create

    assert_equal 1234, Term.current.id
  end
end
