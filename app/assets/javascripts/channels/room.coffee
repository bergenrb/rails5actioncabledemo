App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    alert data['message']
    # Called when there's incoming data on the websocket for this channel

  speak: (data) ->
    @perform 'speak', message: data

  $(document).on 'keypress', '[data-behaviour~=room_speaker]', (event) ->
    if event.keyCode is 13 # return = send
      App.room.speak event.target.value
      event.target.value = ''
      event.preventDefault()
