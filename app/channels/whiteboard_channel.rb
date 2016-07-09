# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class WhiteboardChannel < ApplicationCable::Channel
  def subscribed
    stream_from "whiteboard_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def type data
    ActionCable.server.broadcast "whiteboard_channel", id: data['id'],
                                                       content: data['content'],
                                                       user_id: data['user_id']
  end
end
