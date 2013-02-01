class App.Views.SubmissionsList extends Backbone.View
  el: 'section.submission-list'

  template: "<ul class='submissions list'></ul>"

  initialize: ->
    @collection.on 'add', @addOne, @
    @collection.on 'add-new', @addNew, @
    @collection.on 'remove', @removeSubmission, @

  render: ->
    @$el.html @template
    @addAll()

  addAll: ->
    @collection.each @addOne, @

  addOne: (submission)->
    view = new App.Views.Submitted({ model: submission })
    @$el.find('ul.list').append(view.render().el)

  addNew: (submission)->
    view = new App.Views.Submitted({ model: submission })
    @$el.find('ul.list').prepend(view.render().el)

  removeSubmission: (model)->
    model.trigger('remove')

  initializeEndlessScrolling: ->
    $(document).endlessScroll
      fireOnce: false
      fireDelay: 10000
      ceaseFireOnEmpty: false
      callback: (f,p,s)=>
        @collection.nextPage()
      ceaseFire: =>
        @collection.isLastPage()
