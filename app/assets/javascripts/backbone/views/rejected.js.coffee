class App.Views.Rejected extends Backbone.View
  tagName: 'li'

  template: HandlebarsTemplates['backbone/templates/rejected']

  initialize: ->
    @$el.attr('id', "request-#{@model.id}")

  render: ->
    json = @model.toJSON()
    _.extend json, { isAdmin: App.isAdmin }
    @$el.html(@template(json))
    @$el.fadeIn()
    @
