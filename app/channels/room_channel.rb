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
    ActionCable.server.broadcast 'room_channel', message: data['message']
  end
end
