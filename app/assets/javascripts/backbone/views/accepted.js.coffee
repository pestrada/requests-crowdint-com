class App.Views.Accepted extends App.Views.Request
  tagName: 'li'

  template: HandlebarsTemplates['backbone/templates/accepted']

  events:
    'click .complete': 'complete'
    'keyup .new_comment' : 'comment'
    'click .comments-count' : 'show_comments'

  initialize: ->
    @$el.attr('id', "request-#{@model.id}")
    @model.on('completed', @completeRequest, @)
    @model.on 'commented', @addComment, @

  render: ->
    json = @model.toJSON()
    created_at = moment(json.created_at).format("MMM Do YY")
    _.extend json, { isAdmin: App.isAdmin, created_at: created_at }
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
