class App.Views.Done extends App.Views.Request
  tagName: 'li'

  template: HandlebarsTemplates['backbone/templates/done']

  events:
    'click .comments-count' : 'show_comments'
    'click .add_comment'    : 'comment_on_click'
    'keyup .new_comment'    : 'comment_on_enter'

  initialize: ->
    @$el.attr('id', "request-#{@model.id}")
    @model.on 'commented', @addComment, @

  render: ->
    json = @model.toJSON()
    @description_auto_links(json)
    @formatProcessedRequest(json)
    @formatCommentsTime(json.comments)
    @$el.html(@template(json))
    @$el.fadeIn()
    @renderComments()
    @
