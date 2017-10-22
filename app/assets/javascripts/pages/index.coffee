class Eksercise.Pages.Index

  @clearSearchInput: (inputElement) ->
    $(inputElement.parentElement).find('label').html ''

  @resetSearchInput: (inputElement) ->
    if inputElement.value.length > 0
      placeholder = ''
    else
      placeholder = 'Type your search query'

    $(inputElement.parentElement).find('label').html placeholder


  @search: (event, inputElement) ->
    if event.keyCode == 13
      $.ajax(
        type: 'GET'
        url: '/search'
        data: { query: inputElement.value }
        success: ->
          alert 'foi'
      )
