class App.Views.Application extends Backbone.View
  el: 'body > .main'

  template: HandlebarsTemplates['backbone/templates/application']

  render: ->
    @$el.html(@template)
