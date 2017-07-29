require 'test_helper'
require 'json'

class TermTest < ActiveSupport::TestCase
  def setup
    stub_term
  end

  test "Term#current_term returns the current term" do
    assert_equal "Fall 2017", Term.new.current_term
  end
end
