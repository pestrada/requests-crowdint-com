class App.Views.Submitted extends Backbone.View
#  el: 'section.submission-list ul'

  tagName: 'li'

  className: 'hidden'

  template: HandlebarsTemplates['backbone/templates/submitted']

  events:
    'click .like': 'like'
    'keyup .new_comment' : 'comment'

  initialize: ->
    @$el.addClass("submission-#{@model.id}")
    @$el.attr('id', "request-#{@model.id}")
    @model.on 'change:votes', @updateVotes, @
    @model.on 'promoted', @promoteRequest, @
    @model.on 'remove', @remove, @
    @model.on 'commented', @addComment, @

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

  promoteRequest: ->
    @model.collection.remove(@model)
    @model.set('state', 'promoted')
    App.promoted_list.add @model, { silent: true }
    App.promoted_list.trigger('add-new', @model)

  remove: ->
    @$el.css('background', '#C7DEA9').fadeOut(1600)
    @stopListening()

  comment: (e)->
    e.preventDefault()
    if e.keyCode is 13
      @model.comment(e.target.value)

  addComment: ()->
    @render()
