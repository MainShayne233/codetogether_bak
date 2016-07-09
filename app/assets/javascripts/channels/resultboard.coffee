App.resultboard = App.cable.subscriptions.create "ResultboardChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if $('#' + data.id + '.code_container').length == 1
      window.output.setValue(data.output)

  run: (id) ->
    @perform 'run', id: id

  clear: (id) ->
    @perform 'clear', id: id