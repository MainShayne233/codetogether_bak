ready = ->

  window.whiteboard = CodeMirror.fromTextArea($('.whiteboard').get(0), {
    lineNumbers: true,
    mode: "text/x-ruby",
    theme: 'base16-dark',
    tabSize: 2
  });

  window.output = CodeMirror.fromTextArea($('.output').get(0), {
    lineNumbers: true,
    theme: 'base16-dark',
    tabSize: 2,
    readOnly: true
  });


  window.whiteboard.on 'keyup', (event) ->
    id = $('.code_container').attr('id')
    content = event.getValue()
    user_id = $('input.user').attr('id')

    $.ajax({
      type: 'PATCH',
      url: '/whiteboards/' + id
      data: {content: content},
      datatype: 'JSON'
    })

    App.whiteboard.type(id, content, user_id)


  $('#run_script').click ->
    id = $('.code_container').attr('id')
    App.resultboard.run(id)


  $('#clear_output').click ->
    id = $('.code_container').attr('id')
    App.resultboard.clear(id)

$(document).ready(ready)
$(document).on('page:change', ready)
