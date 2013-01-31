class App.Views.Submitted extends Backbone.View
#  el: 'section.submission-list ul'

  tagName: 'li'

  className: 'hidden'

  template: HandlebarsTemplates['backbone/templates/submitted']

  events:
    'click .like': 'like'

  initialize: ->
    @model.on 'change:votes', @updateVotes, @
    @model.on 'accepted', @acceptSubmission, @
    @model.on 'remove', @remove, @

  render: ->
    @$el.html(@template(@model.toJSON()))
    @$el.fadeIn()
    @

  like: ->
    @model.like()

  updateVotes: (model)->
    @$el.find('.votes').html(model.get('votes'))

  acceptSubmission: ->
    @model.collection.remove(@model)
    App.accepted_list.add @model

  remove: ->
    @$el.css('background', '#C7DEA9').fadeOut(1600)
    @stopListening()
