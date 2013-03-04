class App.Views.Promoted extends App.Views.Request
  tagName: 'li'

  template: HandlebarsTemplates['backbone/templates/promoted']

  events:
    'click .accept'  : 'accept'
    'click .reject'  : 'reject'
    'keyup .new_comment' : 'comment'
    'click .comments-count' : 'show_comments'


  initialize: ->
    @$el.attr('id', "request-#{@model.id}")
    @model.on 'accepted', @acceptRequest, @
    @model.on 'rejected', @rejectRequest, @
    @model.on 'commented', @addComment, @

  render: ->
    json = @model.toJSON()
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

