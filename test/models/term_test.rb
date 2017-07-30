require 'test_helper'
require 'json'

class TermTest < ActiveSupport::TestCase
  def setup
    stub_term
  end

  test '.id returns the current term id' do
    assert_equal 1139, Term.new.id
  end
end
