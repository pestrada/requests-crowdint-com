class App.Views.SubmittedList extends Backbone.View
  el: 'section.submission-list'

  template: HandlebarsTemplates['backbone/templates/submission_list']

  initialize: ->
    @collection.on 'add', @addOne, @
    @collection.on 'add-new', @addNew, @
    @collection.on 'remove', @removeRequest, @

  render: ->
    @$el.html @template
    @addAll()

  addAll: ->
    @collection.each @addOne, @

  addOne: (request)->
    view = new App.Views.Submitted({ model: request })
    @$el.find('ul.list').append(view.render().el)

  addNew: (request)->
    view = new App.Views.Submitted({ model: request })
    @$el.find('ul.list').prepend(view.render().el)

  removeRequest: (model)->
    model.trigger('remove')

  initializeEndlessScrolling: ->
    $('submission-list').endlessScroll
      fireOnce: false
      fireDelay: 10000
      ceaseFireOnEmpty: false
      callback: (f,p,s)=>
        @collection.nextPage()
      ceaseFire: =>
        @collection.isLastPage()
