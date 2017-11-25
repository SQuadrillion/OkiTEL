class Api::CallController < ApplicationController
  def registers
    time = Time.now
    current_time = "#{time.year}-#{time.month}-#{time.day} #{time.hour}:#{time.min}:00"
    @registers = Register.where('time = ?', "2017-11-25 15:18:00")
    render json: @registers
  end
end
