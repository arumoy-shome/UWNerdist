require 'test_helper'

class TermTest < ActiveSupport::TestCase
  def setup
    stub_term
  end

  test "#create creates a new record for the current term using the api" do
    Term.destroy_all

    assert_difference 'Term.count' do
      Term.create
    end

    record = Term.find(1234)

    assert_equal 1234, record.id
    assert_equal 'Winter 2017', record.description
  end

  test "#current returns the record for current term" do
    assert_equal 1234, Term.current.id
  end
end
