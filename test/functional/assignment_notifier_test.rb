require 'test_helper'

class AssignmentNotifierTest < ActionMailer::TestCase
  test "assigned" do
    mail = AssignmentNotifier.assigned
    assert_equal "Assigned", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
