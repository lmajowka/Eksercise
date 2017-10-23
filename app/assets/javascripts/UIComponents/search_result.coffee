class Eksercise.UIComponents.SearchResult

  @resetSearchResults: ->
    $('#search_results_container').html ''

  @renderSearchResults: (data, page) ->
    if page == 1 && data.length == 0
      $('#search_results_container').append @noResultsTitle()

    if data.length > 0
      if page == 1
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

  @noResultsTitle: ->
    '<h2 class="cui__selector&#45;&#45;direct__title"> No results, please review your search or try a different one </h2>'