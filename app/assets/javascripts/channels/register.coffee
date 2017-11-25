App.register = App.cable.subscriptions.create "RegisterChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $("tbody").prepend("<tr id="post_#{date.id}"><td>おなまえ:#{data.name}</td><td>電話番号:#{data.todo}</td><td>ネタ:#{data.todo}</td><td>範囲:#{data.range}</td><td>何時におこしてほしい？:#{data.time}</td><td></td><td></td><td></td></tr>");
    console.log(data);
