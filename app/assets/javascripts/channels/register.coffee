App.register = App.cable.subscriptions.create "RegisterChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    if data.is_delete
      # hoge
    else
      $("tbody").prepend("<tr id=\"register_#{data.id}\"><td>おなまえ:#{data.name}</td><td>電話番号:#{data.number}</td><td>ネタ:#{data.todo}</td><td>範囲:#{data.range}</td><td>何時におこしてほしい？:#{register.time}</td></tr>");
    console.log(data);
