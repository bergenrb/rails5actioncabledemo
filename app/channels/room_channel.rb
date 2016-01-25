# Be sure to restart your server when you modify this file. 
# Action Cable runs in an EventMachine loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # Called from #speak in room.coffee
  def speak(data)
    message = Message.create content: data['message']
    ActionCable.server.broadcast 'room_channel', message: render_partial(message)
  end

  def render_partial(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message})
  end
end
