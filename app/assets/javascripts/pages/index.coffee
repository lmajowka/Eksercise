class Eksercise.Pages.Index

  @pageResult = 1
  @blockLoadMore = false
  @timeOutMessage = null

  @inputElement: ->
    $('#search_query_input')[0]

  @searchInputComponent: ->
    new Eksercise.UIComponents.SearchInput @inputElement()

  @search: (event) ->
    if event.keyCode == 13
      Eksercise.UIComponents.SearchResult.resetSearchResults()
      @pageResult = 1
      @requestSearch @inputElement()


  @requestSearch: ->
    @blockLoadMore = true
    @timeOutMessage = setTimeout(@requestTimeOut, 20000)

    @searchInputComponent().disableSearchInput()

    $.ajax(
      type: 'GET'
      url: '/search'
      data: { query: @inputElement().value, page: @pageResult, uuid: uniqueUserIdentifier }
    )

  @handleSearchResponse: (data) ->
    @blockLoadMore = false unless data.length == 0
    Eksercise.UIComponents.SearchResult.renderSearchResults data, @pageResult
    @searchInputComponent().enableSearchInput()
    clearTimeout @timeOutMessage

  @loadMore: ->
    unless @blockLoadMore
      scrollBottomPosition = $('.results').height() - $(document).scrollTop() - $(window).height()
      if scrollBottomPosition < 0
        @pageResult += 1
        @requestSearch()


  @requestTimeOut: =>
    @searchInputComponent().enableSearchInput()
    alert 'Something went wrong, please try again or contact support'



