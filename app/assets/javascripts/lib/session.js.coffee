class window.Session
  @_loaded: false

  @load = ->
    callbacks = $.Callbacks();
    callbacks.add(@loadLoginItems, @setStatus)
    Session.loadSession(callbacks)

  @loadLoginItems = ->
    Session.sessionCssDeclarations()

  @setStatus = ->
    Session._loaded = true
    $.event.trigger
      type: "sessionLoaded"
    console.log "Session Loaded"

  @loadSession = (callbacks) ->
    $.ajaxSetup({ cache: false });

    xhr = $.getJSON "/users/me", (response) ->
      gon.user_id               = response.user_id
      gon.current_user          = response.current_user
      $("meta[name='csrf-token']").attr "content", response.token
      $("meta[name='csrf-param']").attr "content", response.param
      $("form input[name=authenticity_token]").attr "value", response.token

    xhr.done(callbacks.fire);

    $.ajaxSetup({ cache: true });

  @sessionCssDeclarations = ->
    if Session.userLoggedOut()
      $(".current-user-hidden").show()
      $(".current-user-visible").hide()
    if Session.userLoggedIn()
      $(".current-user-hidden").hide()
      $(".current-user-visible").show()

  @userLoggedIn = ->
    !(gon.current_user == "false" or gon.current_user == false)

  @userLoggedOut = ->
    gon.current_user == "false" or gon.current_user == false