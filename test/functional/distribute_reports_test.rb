require 'test_helper'

class DistributeReportsTest < ActionMailer::TestCase
  test "weekly_mg_report" do
    mail = DistributeReports.weekly_mg_report
    assert_equal "Weekly mg report", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
