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

GROUPS = { '1' => 'Super Users', '2' => 'Management Group', 
'3' => 'Project Managers', '4' => 'Technical Leads' }
