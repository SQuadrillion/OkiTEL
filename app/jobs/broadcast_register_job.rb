class BroadcastRegisterJob < ApplicationJob
  queue_as :default

  def perform(register_obj)
    # Do something later
    # TODO: Implements This Job
    ActionCable.server.broadcast "register_channel",
      # add_comment: register_obj.content,
      # hoge: register_obj.fuga
  end
end
