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
    created_at = moment(json.created_at).format("MMM Do YY")
    _.extend json, { isAdmin: App.isAdmin, created_at: created_at }
    @$el.html(@template(json))
    @$el.fadeIn()
    @renderComments()
    @
