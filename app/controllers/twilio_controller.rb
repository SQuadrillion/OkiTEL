class TwilioController < ApplicationController
  def callback
    render json: params
  end
end
