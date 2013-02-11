class App.Views.Rejected extends Backbone.View
  tagName: 'li'

  template: HandlebarsTemplates['backbone/templates/rejected']

  initialize: ->
    @$el.attr('id', "request-#{@model.id}")

  render: ->
    json = @model.toJSON()
    created_at = moment(json.created_at).format("MMM Do YY")
    _.extend json, { isAdmin: App.isAdmin, created_at: created_at }
    @$el.html(@template(json))
    @$el.fadeIn()
    @
