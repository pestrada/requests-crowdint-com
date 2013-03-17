class App.Views.RejectedList extends Backbone.View
  el: '.rejected-list'
  template: HandlebarsTemplates["backbone/templates/rejected_list"]

  render: ->
    @$el.html @template
    @addAll()

  addAll: ->
    @collection.each @addOne, @

  addOne: (request)->
    view = new App.Views.Rejected({ model: request })
    @$el.find('ul.rejected-l').append(view.render().el)