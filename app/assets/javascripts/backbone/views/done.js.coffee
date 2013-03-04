class App.Views.Done extends App.Views.Request
  tagName: 'li'

  template: HandlebarsTemplates['backbone/templates/done']

  events:
    'keyup .new_comment' : 'comment'
    'click .comments-count' : 'show_comments'

  initialize: ->
    @$el.attr('id', "request-#{@model.id}")
    @model.on 'commented', @addComment, @

  render: ->
    json = @model.toJSON()
    @formatProcessedRequest(json)
    @formatCommentsTime(json.comments)
    @$el.html(@template(json))
    @$el.fadeIn()
    @renderComments()
    @
