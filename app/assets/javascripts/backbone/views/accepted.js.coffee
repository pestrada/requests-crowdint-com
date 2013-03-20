class App.Views.Accepted extends App.Views.Request
  tagName: 'li'

  template: HandlebarsTemplates['backbone/templates/accepted']

  events:
    'click .complete': 'complete'
    'click .comments-count' : 'show_comments'
    'click .add_comment'    : 'comment_on_click'
    'keyup .new_comment'    : 'comment_on_enter'
    'click'                 : 'highlightRequest'

  initialize: ->
    @$el.attr('id', "request-#{@model.id}")
    @model.on('completed', @completeRequest, @)
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

  completeRequest: ->
    completed_view = new App.Views.Done({ model: @model })
    @$el.replaceWith completed_view.render().el

  complete: (e) ->
    e.preventDefault()
    @model.complete()
    @undelegateEvents()
