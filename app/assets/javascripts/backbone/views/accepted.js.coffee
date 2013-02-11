class App.Views.Accepted extends Backbone.View
  tagName: 'li'

  template: HandlebarsTemplates['backbone/templates/accepted']

  events:
    'click .complete': 'complete'

  initialize: ->
    @$el.attr('id', "request-#{@model.id}")
    @model.on('completed', @completeSubmission, @)

  render: ->
    json = @model.toJSON()
    _.extend json, { isAdmin: App.isAdmin }
    @$el.html(@template(json))
    @$el.fadeIn()
    @

  completeSubmission: ->
    completed_view = new App.Views.Done({ model: @model })
    @$el.replaceWith completed_view.render().el

  complete: (e) ->
    e.preventDefault()
    @model.complete()
    @undelegateEvents()
