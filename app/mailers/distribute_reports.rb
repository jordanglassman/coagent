class DistributeReports < ActionMailer::Base
  default from: "coagent@cogentsystems.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.distribute_reports.weekly_mg_report.subject
  #
  def weekly_mg_report(email)
    @greeting = "Hi"

    attachments.inline["weekly_status_#{Date.today}.pdf"] = File.read("#{Rails.root}/public/reports/weekly_status_#{Date.today}.pdf")
    
    mail to: email
    mail subject: 'CoAgent Weekly Status Report'
  end
end
