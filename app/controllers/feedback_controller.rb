class FeedbackController < ApplicationController
	
	before_filter :require_user
	
  def compose_feedback
  	respond_to do |format|
      format.html 
    end
  end
  def compose_feature_suggestion
  	respond_to do |format|
      format.html # 
    end
  end
  def transmit
  	@name = params[:name]
  	@user_name = params[:user_name]
  	@email = params[:email]
  	@description = params[:description] 
  	FeedbackSender.transmit(@name,@user_name,@email,@description).deliver
  	respond_to do |format|
      format.html 
    end  	
  end

end
