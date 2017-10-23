App.search_results = App.cable.subscriptions.create "SearchResultsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    Eksercise.Pages.Index.handleSearchResponse data
    # Called when there's incoming data on the websocket for this channel
