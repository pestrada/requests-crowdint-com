class App.Views.Promoted extends Backbone.View
  tagName: 'li'

  template:                HandlebarsTemplates['backbone/templates/promoted']
  template_admin:          HandlebarsTemplates['backbone/templates/promoted_admin']
  template_accepted_admin: HandlebarsTemplates['backbone/templates/promoted_accepted_admin']

  events:
    'click .accept'  : 'accept'
    'click .reject'  : 'reject'
    'click .complete': 'complete'

  initialize: ->
    @model.on 'accepted', @acceptSubmission, @
    @model.on 'rejected', @rejectSubmission, @
    @model.on 'completed', @completeSubmission, @

  render: ->
    if App.isAdmin == true
      @$el.html(@template_admin(@model.toJSON()))
      if @model.get('state') == 'accepted'
        @$el.html(@template_accepted_admin(@model.toJSON()))
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

  complete: (e) ->
    e.preventDefault()
    @model.complete()

  acceptSubmission: ->
    @$el.find('.state div').removeClass().addClass('accepted')
    @$el.find('.actions').hide()

  rejectSubmission: ->
    @$el.find('.state div').removeClass().addClass('rejected')
    @$el.find('.actions').hide()

  completeSubmission: ->
    @$el.find('.state div').removeClass().addClass('done')
    @$el.find('.actions').hide()
