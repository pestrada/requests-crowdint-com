class App.Views.Request extends Backbone.View
  commentsTemplate: HandlebarsTemplates['backbone/templates/comments']

  renderComments: ->
    @$el.find('.comments-area').html(@commentsTemplate(@model.toJSON()))

  comment: (value)->
    @model.comment(value)

  addComment: ()->
    @formatCommentsTime(@model.toJSON().comments)
    @renderComments()
    list = @$el.find('.comments-area ul')
    list.scrollTop list.prop('scrollHeight')

  show_comments: ()->
    @$el.find('.comments-area').toggleClass('hidden')

  formatCommentsTime: (comments) ->
    for comment in comments
      time = moment(comment.created_at).fromNow()
      _.extend comment, {comment: comment.comment.autoLink(), created_at: time}

  formatProcessedRequest: (json)->
    time = moment(json.created_at).format("MMM Do YY")
    _.extend json, { isAdmin: App.isAdmin, created_at: time }

  comment_on_enter: (e)->
    e.preventDefault()
    @$el.find('.char-counter').text(140 - @$el.find('.new_comment').val().length)

  comment_on_click: (e)->
    e.preventDefault()
    value = @$el.find('.new_comment').val()
    @comment(value)

  description_auto_links: (json) ->
    _.extend json, { description: json.description.autoLink() }

  highlightRequest: ->
    if location.hash[1] == 'h' 
      id = '#history-requests/' + @$el.attr('id').replace( /^\D+/g, '');
    else
      id = '#requests/' + @$el.attr('id').replace( /^\D+/g, '');
    window.history.pushState("", "", id);
    $('li').removeClass('selected')
    @$el.addClass('selected')