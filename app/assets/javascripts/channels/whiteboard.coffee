whiteboard_id = $('.code_container').attr('id')

App.whiteboard = App.cable.subscriptions.create "WhiteboardChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if $('#' + data.user_id + '.user').length == 0 and $('#' + data.id + '.code_container').length == 1
      window.whiteboard.setValue(data.content)

  type: (id, content, user_id) ->
    @perform 'type', id: id, content: content, user_id: user_id
