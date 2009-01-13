require 'test_helper'

class NotificationsTest < ActionMailer::TestCase
  fixtures :all
  test "assigned" do
    @expected.subject = 'Notifications#assigned'
    @expected.body    = read_fixture('assigned')
    @expected.date    = Time.now
    
    mail = Notifications.create_assigned(assets(:alice_macbook), @expected.date)
    # assert_equal @expected.encoded, mail.encoded
  end

  test "unassigned" do
    @expected.subject = 'Notifications#unassigned'
    @expected.body    = read_fixture('unassigned')
    @expected.date    = Time.now

    mail = Notifications.create_unassigned(assets(:alice_macbook), @expected.date)
    # assert_equal @expected.encoded, mail.encoded
  end

end
