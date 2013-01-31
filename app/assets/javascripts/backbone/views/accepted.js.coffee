class App.Views.Accepted extends Backbone.View
  tagName: 'li'

  template: HandlebarsTemplates['backbone/templates/accepted']

  render: ->
    @$el.html(@template(@model.toJSON()))
    @$el.fadeIn()
    @
