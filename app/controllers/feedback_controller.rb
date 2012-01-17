class FeedbackController < ApplicationController
  def compose
  	respond_to do |format|
      format.html # compose.html.erb
    end
  end

  def transmit
  	respond_to do |format|
      format.html # transmit.html.erb
    end  	
  end

end
