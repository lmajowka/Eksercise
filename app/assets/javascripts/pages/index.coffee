class Eksercise.Pages.Index

  @search: (event, inputElement) ->
    if event.keyCode == 13
      $.ajax(
        type: 'GET'
        url: '/search'
        data: { query: inputElement.value }
        success: (data) =>
          if data.length > 0
            Eksercise.UIComponents.SearchResult.renderSearchResults data
      )



