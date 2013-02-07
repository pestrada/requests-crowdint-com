class App.Views.Promoted extends Backbone.View
  tagName: 'li'

  template:       HandlebarsTemplates['backbone/templates/promoted']
  template_admin: HandlebarsTemplates['backbone/templates/promoted_admin']

  events:
    'click .accept': 'accept'
    'click .reject': 'reject'

  initialize: ->
    @model.on 'accepted', @acceptSubmission, @
    @model.on 'rejected', @rejectSubmission, @

  render: ->
    if App.isAdmin == true
      @$el.html(@template_admin(@model.toJSON()))
    else
      @$el.html(@template(@model.toJSON()))
    @$el.fadeIn()
    @

  accept: (e) ->
    e.preventDefault()
    @model.accept()

  reject: (e) ->
    e.preventDefault()
    @model.reject()

  acceptSubmission: ->
    @$el.addClass('accepted')
    @$el.find('.actions').hide()

  rejectSubmission: ->
    @$el.addClass('rejected')
    @$el.find('.actions').hide()
