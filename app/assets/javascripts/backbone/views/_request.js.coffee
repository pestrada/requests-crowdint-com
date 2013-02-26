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
