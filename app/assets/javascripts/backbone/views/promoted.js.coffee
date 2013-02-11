class App.Views.Promoted extends Backbone.View
  tagName: 'li'

  template: HandlebarsTemplates['backbone/templates/promoted']

  events:
    'click .accept'  : 'accept'
    'click .reject'  : 'reject'

  initialize: ->
    @$el.attr('id', "request-#{@model.id}")
    @model.on 'accepted', @acceptSubmission, @
    @model.on 'rejected', @rejectSubmission, @

  render: ->
    json = @model.toJSON()
    _.extend json, { isAdmin: App.isAdmin }
    @$el.html(@template(json))
    @$el.fadeIn()
    @

  acceptSubmission: ->
    accepted_view = new App.Views.Accepted({ model: @model })
    @$el.replaceWith accepted_view.render().el

  accept: (e) ->
    e.preventDefault()
    @model.accept()
    @stopListening()

  rejectSubmission: ->
    rejected_view = new App.Views.Rejected({ model: @model })
    @$el.replaceWith rejected_view.render().el

  reject: (e) ->
    e.preventDefault()
    @model.reject()
    @stopListening()
