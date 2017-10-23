class Eksercise.Pages.Index

  @pageResult = 1
  @blockLoadMore = false

  @inputElement: ->
    $('#search_query_input')[0]

  @search: (event) ->
    if event.keyCode == 13
      Eksercise.UIComponents.SearchResult.resetSearchResults()
      @pageResult = 1
      @requestSearch @inputElement()


  @requestSearch: ->
    @blockLoadMore = true

    seachInputCompoment = new Eksercise.UIComponents.SearchInput @inputElement()
    seachInputCompoment.disableSearchInput()

    $.ajax(
      type: 'GET'
      url: '/search'
      data: { query: @inputElement().value, page: @pageResult }
    )

  @handleSearchResponse: (data) ->
    @blockLoadMore = false unless data.length == 0
    Eksercise.UIComponents.SearchResult.renderSearchResults data, @pageResult
    seachInputCompoment.enableSearchInput()

  @loadMore: ->
    unless @blockLoadMore
      scrollBottomPosition = $('.results').height() - $(document).scrollTop() - $(window).height()
      if scrollBottomPosition < 0
        @pageResult += 1
        @requestSearch()




