class App.Views.AcceptedList extends Backbone.View
  el: 'section.submission-list'

  className: 'hidden'

  template: "<ul class='accepted list'></ul>"

  render: ->
    @$el.html @template
    @addAll()

  addAll: ->
    @collection.each @addOne, @

  addOne: (accepted)->
    view = new App.Views.Accepted({ model: accepted })
    @$el.find('ul.list').prepend view.render().el
