class App.Views.Request extends Backbone.View
  commentsTemplate: HandlebarsTemplates['backbone/templates/comments']

  renderComments: ->
    @$el.find('.comments-area').html(@commentsTemplate(@model.toJSON()))

  comment: (e)->
    e.preventDefault()
    if e.keyCode is 13
      @model.comment(e.target.value)

  addComment: ()->
    @renderComments()
    list = @$el.find('.comments-area ul')
    list.scrollTop list.prop('scrollHeight')

  show_comments: ()->
    @$el.find('.comments-area').toggleClass('hidden')

  formatCommentsTime: (comments) ->
    for comment in comments
      time = moment(comment.created_at).fromNow()
      _.extend comment, {created_at: time}

  formatProcessedRequest: (json)->
    time = moment(json.created_at).format("MMM Do YY")
    _.extend json, { isAdmin: App.isAdmin, created_at: time }
