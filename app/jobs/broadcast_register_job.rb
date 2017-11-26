class BroadcastRegisterJob < ApplicationJob
  queue_as :default

  def perform(register_obj, is_delete)
    # Do something later
    # TODO: Implements This Job
    ActionCable.server.broadcast "register_channel", {
        is_delete: is_delete,
        id: register_obj.id,
        name: register_obj.name,
        number: register_obj.number,
        range: register_obj.range,
        time: format_date(register_obj.time),
        todo: register_obj.todo
    }
      # add_comment: register_obj.content,
      # hoge: register_obj.fuga
  end

  private
    def format_date(time)
      return "#{time.year}-#{time.month}-#{time.day} #{time.hour}:#{time.min}:00"
    end
end
