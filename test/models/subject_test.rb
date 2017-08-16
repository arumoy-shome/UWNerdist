require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  def setup
    stub_term
    stub_subject
  end

  test "#update adds new subjects to the db" do
    Subject.update

    assert_equal 5, Subject.count
  end

  test '#update does nothing if no new subjects are returned by the api' do
    Subject.update

    assert_no_difference 'Subject.count' do
      Subject.update
    end
  end

  test "#current_subjects returns a list of subjects offered in current term" do
    stub_current_subjects

    assert_equal ['CS', 'SCI', 'SYDE'], Subject.current_subjects
  end
end
