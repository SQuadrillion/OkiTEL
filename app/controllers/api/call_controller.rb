class Api::CallController < ApplicationController
  def registers
    time = Time.now
    current_time = "#{time.year}-#{time.month}-#{time.day} #{time.hour}:#{time.min}:00"
    @registers = Register.where('time < ?', current_time)
    render json: @registers
  end

  def remain_times
    @register_time_and_id = Register.return_to_id_and_time
    render json: @register_time_and_id
  end
end
