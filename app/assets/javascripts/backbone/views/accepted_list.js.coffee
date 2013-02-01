class App.Views.AcceptedList extends Backbone.View
  el: 'section.submission-list'

  className: 'hidden'

  template: "<ul class='accepted list'></ul>"

  initialize: ->
    @collection.on 'add', @addOne, @

  render: ->
    @$el.html @template
    @addAll()

  addAll: ->
    @collection.each @addOne, @

  addOne: (accepted)->
    view = new App.Views.Accepted({ model: accepted })
    @$el.find('ul.list').prepend view.render().el

  initializeEndlessScrolling: ->
    $(document).endlessScroll
      fireOnce: false
      fireDelay: 10000
      ceaseFireOnEmpty: false
      callback: (f,p,s)=>
        @collection.nextPage()
      ceaseFire: =>
        @collection.isLastPage()
