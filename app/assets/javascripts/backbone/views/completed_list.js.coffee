class App.Views.CompletedList extends Backbone.View
  el: '.completed-list'

  template: HandlebarsTemplates['backbone/templates/completed_list']

  render: ->
    @$el.html @template
    @addAll()

  addAll: ->
    @collection.each @addOne, @

  addOne: (request)->
    view = new App.Views.Done({ model: request })
    @$el.find('.complete-l').append(view.render().el)