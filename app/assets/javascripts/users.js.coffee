App.Users =

  hoverize: (users) ->
    $(document).on {
      'mouseenter focus': ->
        $("div.participation-not-allowed", this).show()
        $("div.participation-allowed", this).hide()
      mouseleave: ->
        $("div.participation-not-allowed", this).hide()
        $("div.participation-allowed", this).show()
    }, users

  initialize: ->
    $('.initialjs-avatar').initial()
    App.Users.hoverize "div.user-direct-message"
    false
