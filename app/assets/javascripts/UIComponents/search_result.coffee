class Eksercise.UIComponents.SearchResult

  @renderSearchResults: (data) ->
    $('#search_results_container').html ''
    $('#search_results_container').append @searchResultsTitle()
    for result in data
      $('#search_results_container').append(@renderSearchResult result)


  @searchResultsTitle: ->
    '<h2 class="cui__selector&#45;&#45;direct__title"> Search results </h2>'

  @renderSearchResult: (result) ->
    JST['views/search_result'](result)

  @calculateAge: (unixTimeStamp) ->
    birthday = new Date(unixTimeStamp * 1000)
    ageDifMs = Date.now() - birthday.getTime()
    ageDate = new Date(ageDifMs)
    Math.abs(ageDate.getUTCFullYear() - 1970)