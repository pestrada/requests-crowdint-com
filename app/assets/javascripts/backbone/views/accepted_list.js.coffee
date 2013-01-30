class App.Views.AcceptedList extends Backbone.View
  el: 'section.submission-list'

  template: "<ul class='accepted list'></ul>"

  render: ->
    @$el.html @template
    @addAll()

  addAll: ->
    @collection.each @addOne

  addOne: (accepted)->
    view = new App.Views.Accepted({ model: accepted })
    view.render()
