class AssignmentNotifier < ActionMailer::Base
  default from: "CoAgent@cogentsystems.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.assignment_notifier.assigned.subject
  #
  def assigned(project,flag)
  	
    @greeting = "Hi"
		@project = project
		
		case flag
		when 'TL'
			if @project.technical_lead != 'TBD'
				mail to: User.find(@project.technical_lead).email
			end
		when 'PM'			
			if @project.project_manager != 'TBD'
				mail to: User.find(@project.project_manager).email
			end
		end

  end
end
