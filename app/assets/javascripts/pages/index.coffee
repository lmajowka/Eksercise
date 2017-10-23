class Eksercise.Pages.Index

  @search: (event, inputElement) ->
    if event.keyCode == 13

      Eksercise.UIComponents.SearchResult.resetSearchResults()

      seachInputCompoment = new Eksercise.UIComponents.SearchInput(inputElement)
      seachInputCompoment.disableSearchInput()

      $.ajax(
        type: 'GET'
        url: '/search'
        data: { query: inputElement.value }
        success: (data) =>
          Eksercise.UIComponents.SearchResult.renderSearchResults data
          seachInputCompoment.enableSearchInput()
      )



