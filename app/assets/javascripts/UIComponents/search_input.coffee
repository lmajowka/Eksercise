class Eksercise.UIComponents.SearchInput

  constructor: (@inputElement) ->

  @resetSearchInput: (inputElement) ->
    if inputElement.value.length > 0
      placeholder = ''
    else
      placeholder = 'Type your search query'

    $(inputElement.parentElement).find('label').html placeholder

  disableSearchInput: ->
    $(@inputElement).attr('disabled', true)
    $(@inputElement.parentElement).addClass('is-disabled')
    $('.loading').show()

  enableSearchInput: ->
    $(@inputElement).attr('disabled', false)
    $(@inputElement.parentElement).removeClass('is-disabled')
    $('.loading').hide()