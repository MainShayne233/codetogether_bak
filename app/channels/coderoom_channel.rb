# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class CoderoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "coderoom_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def type data
    content = data['content'].profane? ? '' : data['content']
    ActionCable.server.broadcast 'coderoom_channel', id: data['id'], content: content, user_id: data['user_id']
  end
end
