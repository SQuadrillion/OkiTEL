class Api::CallController < ApplicationController
  def registers
    time = Time.now
    current_time = "#{time.year}-#{time.month}-#{time.day} #{time.hour}:#{time.min}:00"
    @registers = Register.where('time < ?', current_time)
    render json: @registers
  end
end
