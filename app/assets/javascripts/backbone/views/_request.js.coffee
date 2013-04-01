class App.Views.Request extends Backbone.View
  commentsTemplate: HandlebarsTemplates['backbone/templates/comments']

  renderComments: ->
    @$el.find('.comments-area').html(@commentsTemplate(@model.toJSON()))

  comment: (value)->
    @model.comment(value)

  addComment: ()->
    @renderComments()
    list = @$el.find('.comments-area ul')
    list.scrollTop list.prop('scrollHeight')
    comments_count = @$el.find('.comments-count span').text @model.get('comments').length
    @.delegateEvents()

  show_comments: ()->
    @$el.find('.comments-area').toggleClass('hidden')

  comment_on_enter: (e)->
    e.preventDefault()
    @$el.find('.char-counter').text(140 - @$el.find('.new_comment').val().length)

  comment_on_click: (e)->
    e.preventDefault()
    @$el.find('.add_comment').css('background-color', '#D8D8D8')
    @.undelegateEvents()
    value = @$el.find('.new_comment').val()
    if value is ''
      @.delegateEvents()
    else
      @comment(value)

  highlightRequest: ->
    if location.hash[1] == 'h' 
      id = '#history-requests/' + @$el.attr('id').replace( /^\D+/g, '');
    else
      id = '#requests/' + @$el.attr('id').replace( /^\D+/g, '');
    window.history.pushState("", "", id);
    $('li').removeClass('selected')
    @$el.addClass('selected')