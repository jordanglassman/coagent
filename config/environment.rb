# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Coagent::Application.initialize!

Coagent::Application.configure do
	config.action_mailer.delivery_method = :smtp
	config.action_mailer.smtp_settings = {
		address: "169.15.16.15",
		domain: "cogentsystems.com"
	}
end

class AuditLogger < Logger
  def format_message(severity, timestamp, progname, msg)
    "#{timestamp.to_formatted_s(:db)} #{severity} #{msg}\n" 
  end 
end               


