class TwilioController < ApplicationController
  def callback
    if params[:DialCallStatus] == "completed" || params[:DialCallStatus] == "answered"
      render html: "<div>deleted</div>"
    else
      render html: "<div>non deleted</div>"
    end
  end
end
