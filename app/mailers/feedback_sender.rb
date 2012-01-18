class FeedbackSender < ActionMailer::Base
  default from: "coagent_feedback@cogentsystems.com"
  default to: "jpglassman@cogentsystems.com"
  default subject: "Feedback from CoAgent"
  def transmit(name,user_name,email,description)
  	
  	@name = name
  	@user_name = user_name
  	@email = email
  	@description = description
  	
    @greeting = "Hi"
    
    mail template_path: 'feedback_sender', template_name: 'new_feedback'
		
   end 
end
