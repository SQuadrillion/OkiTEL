class TwilioController < ApplicationController
  include TwilioHelper

  def callback
    if params[:DialCallStatus] == "completed" || params[:DialCallStatus] == "answered"
      register = Register.find_by(number: get_number())
      if register.destroy
        render html: "destroyed"
      else
        render html: "destroy failed"
      end
    else
      render html: "non destroyed"
    end
  end
end
