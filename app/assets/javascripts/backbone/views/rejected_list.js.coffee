class App.Views.RejectedList extends Backbone.View
  el: '.rejected-list'
  template: HandlebarsTemplates["backbone/templates/rejected_list"]

  render: ->
    @$el.html @template
    @addAll()

  addAll: ->
    @collection.each @addOne, @

  addOne: (request)->
    view_class = _.str.capitalize(request.get('state'))
    view_class = "TimedOut" if view_class == "Timed_out"
    view = eval("new App.Views.#{view_class}({ model: request })")
    @$el.find('ul.rejected-l').append(view.render().el)