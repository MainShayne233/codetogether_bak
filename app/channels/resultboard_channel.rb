# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ResultboardChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'resultboard_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def run data
    whiteboard = Whiteboard.find(data['id'])
    whiteboard.run!
    ActionCable.server.broadcast "resultboard_channel", id: data['id'],
                                                        output: whiteboard.output
  end

  def clear data
    whiteboard = Whiteboard.find(data['id'])
    whiteboard.update_attributes output: ''
    ActionCable.server.broadcast "resultboard_channel", id: data['id'],
                                                        output: whiteboard.output
  end
end
