$(document).endlessScroll
  fireOnce: false
  fireDelay: 10000
  ceaseFireOnEmpty: false
  callback: (f,p,s)->
    App.submitted_list.nextPage()
  ceaseFire: ->
    console.log App.submitted_list.isLastPage()
    App.submitted_list.isLastPage()
