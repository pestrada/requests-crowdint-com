class App.Views.Accepted extends Backbone.View
  tagName: 'li'

  template: HandlebarsTemplates['backbone/templates/accepted']

  events:
    'click .complete': 'complete'

  initialize: ->
    @$el.attr('id', "request-#{@model.id}")
    @model.on('completed', @completeRequest, @)

  render: ->
    json = @model.toJSON()
    created_at = moment(json.created_at).format("MMM Do YY")
    _.extend json, { isAdmin: App.isAdmin, created_at: created_at }
    @$el.html(@template(json))
    @$el.fadeIn()
    @

  completeRequest: ->
    completed_view = new App.Views.Done({ model: @model })
    @$el.replaceWith completed_view.render().el

  complete: (e) ->
    e.preventDefault()
    @model.complete()
    @undelegateEvents()
