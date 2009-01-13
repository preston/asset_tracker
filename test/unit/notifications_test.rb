require 'test_helper'

class NotificationsTest < ActionMailer::TestCase
  test "assigned" do
    @expected.subject = 'Notifications#assigned'
    @expected.body    = read_fixture('assigned')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Notifications.create_assigned(@expected.date).encoded
  end

  test "unassigned" do
    @expected.subject = 'Notifications#unassigned'
    @expected.body    = read_fixture('unassigned')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Notifications.create_unassigned(@expected.date).encoded
  end

end
