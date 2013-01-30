class App.Views.SubmissionsList extends Backbone.View
  el: 'section.submission-list'

  template: "<ul class='submissions list'></ul>"

  initialize: ->
    @collection.on 'add', @addOne, @

  render: ->
    @$el.html @template
    @addAll()

  addAll: ->
    @collection.each @addOne

  addOne: (submission)->
    view = new App.Views.Submitted({ model: submission })
    view.render()
