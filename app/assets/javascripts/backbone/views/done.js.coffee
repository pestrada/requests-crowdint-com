class App.Views.Done extends Backbone.View
  tagName: 'li'

  template: HandlebarsTemplates['backbone/templates/done']

  render: ->
    json = @model.toJSON()
    _.extend json, { isAdmin: App.isAdmin }
    @$el.html(@template(json))
    @$el.fadeIn()
    @
