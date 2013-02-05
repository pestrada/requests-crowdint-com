class App.Views.Promoted extends Backbone.View
  tagName: 'li'

  template: HandlebarsTemplates['backbone/templates/promoted']

  render: ->
    @$el.html(@template(@model.toJSON()))
    @$el.fadeIn()
    @
