class Eksercise.UIComponents.SearchInput

  @clearSearchInput: (inputElement) ->
    $(inputElement.parentElement).find('label').html ''

  @resetSearchInput: (inputElement) ->
    if inputElement.value.length > 0
      placeholder = ''
    else
      placeholder = 'Type your search query'

    $(inputElement.parentElement).find('label').html placeholder