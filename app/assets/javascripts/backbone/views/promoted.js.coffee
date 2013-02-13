class App.Views.Promoted extends Backbone.View
  tagName: 'li'

  template: HandlebarsTemplates['backbone/templates/promoted']

  events:
    'click .accept'  : 'accept'
    'click .reject'  : 'reject'

  initialize: ->
    @$el.attr('id', "request-#{@model.id}")
    @model.on 'accepted', @acceptRequest, @
    @model.on 'rejected', @rejectRequest, @

  render: ->
    json = @model.toJSON()
    created_at = moment(json.created_at).format("MMM Do YY")
    _.extend json, { isAdmin: App.isAdmin, created_at: created_at }
    @$el.html(@template(json))
    @$el.fadeIn()
    @

  acceptRequest: ->
    accepted_view = new App.Views.Accepted({ model: @model })
    @$el.replaceWith accepted_view.render().el

  accept: (e) ->
    e.preventDefault()
    @model.accept()
    @undelegateEvents()

  rejectRequest: ->
    rejected_view = new App.Views.Rejected({ model: @model })
    @$el.replaceWith rejected_view.render().el

  reject: (e) ->
    e.preventDefault()
    @model.reject()
    @undelegateEvents()
