App.register = App.cable.subscriptions.create "RegisterChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    if data.is_delete
      $("#r_#{data.id}").remove();
    else
      $("div#container").prepend("<a id=\"r_#{data.id}\" class=\"row list\" href=\"registers/#{data.id}\"><div class=\"col-xs-12\"><div class=\"text-center\"><div class=\"col-xs-4\"><div style=\"font-size:1.5em; line-height: 5em;\">00:30</div></div><div class=\"col-xs-8\">#{data.name}さん<br>#{data.todo}</div></div></div></a>");
      remain_times.push(data.id, data.time);    
    console.log(data);
