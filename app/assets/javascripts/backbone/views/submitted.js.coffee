class App.Views.Submitted extends Backbone.View
#  el: 'section.submission-list ul'

  tagName: 'li'

  className: 'hidden'

  template: HandlebarsTemplates['backbone/templates/submitted']

  events:
    'click .like': 'like'

  initialize: ->
    @$el.addClass("submission-#{@model.id}")
    @$el.attr('id', "request-#{@model.id}")
    @model.on 'change:votes', @updateVotes, @
    @model.on 'promoted', @promoteSubmission, @
    @model.on 'remove', @remove, @

  render: ->
    json = @model.toJSON()
    time = moment(json.created_at).add('day', 7).fromNow();
    _.extend json, { created_at: time }
    @$el.html(@template(json))
    @$el.fadeIn()
    @

  like: (e)->
    e.preventDefault()
    @model.like()
    @undelegateEvents()

  updateVotes: (model)->
    @$el.find('.votes span:first-child').html(model.get('votes'))

  promoteSubmission: ->
    @model.collection.remove(@model)
    @model.set('state', 'promoted')
    App.promoted_list.add @model, { silent: true }
    App.promoted_list.trigger('add-new', @model)

  remove: ->
    @$el.css('background', '#C7DEA9').fadeOut(1600)
    @stopListening()
