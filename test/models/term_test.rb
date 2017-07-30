require 'test_helper'
require 'json'

class TermTest < ActiveSupport::TestCase
  def setup
    stub_term
  end

  test '.id returns the current term id' do
    assert_equal 1139, Term.new.id
  end

  test ".name returns the current term name" do
    assert_equal 'Fall 2017', Term.new.name
  end
end
