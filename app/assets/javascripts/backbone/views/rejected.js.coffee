class App.Views.Rejected extends App.Views.Request
  tagName: 'li'

  template: HandlebarsTemplates['backbone/templates/rejected']

  events:
    'click .comments-count' : 'show_comments'
    'click .add_comment'    : 'comment_on_click'
    'keyup .new_comment'    : 'comment_on_enter'
    'click'                 : 'highlightRequest'

  initialize: ->
    @$el.attr('id', "request-#{@model.id}")
    @model.on 'commented', @addComment, @

  render: ->
    json = @model.toJSON()
    @$el.html(@template(json))
    @$el.fadeIn()
    @renderComments()
    @
