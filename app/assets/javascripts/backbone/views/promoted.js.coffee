class App.Views.Promoted extends App.Views.Request
  tagName: 'li'

  template: HandlebarsTemplates['backbone/templates/promoted']

  events:
    'click .accept'  : 'accept'
    'click .reject'  : 'reject'
    'click .comments-count' : 'show_comments'
    'click .add_comment'    : 'comment_on_click'
    'keyup .new_comment'    : 'comment_on_enter'


  initialize: ->
    @$el.attr('id', "request-#{@model.id}")
    @model.on 'accepted', @acceptRequest, @
    @model.on 'rejected', @rejectRequest, @
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

  acceptRequest: ->
    accepted_view = new App.Views.Accepted({ model: @model })
    @$el.replaceWith accepted_view.render().el

  accept: (e) ->
    e.preventDefault()
    @model.accept()
    @undelegateEvents()

  rejectRequest: ->
    rejected_view = new App.Views.Rejected({ model: @model })
    @$el.replaceWith rejected_view.render().el

  reject: (e) ->
    e.preventDefault()
    @model.reject()
    @undelegateEvents()

