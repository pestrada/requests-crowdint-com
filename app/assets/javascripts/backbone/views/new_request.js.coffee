class App.Views.NewRequest extends Backbone.View
  el: 'section.form'

  template: HandlebarsTemplates['backbone/templates/new_request']

  events:
    'click #add_new_submission': 'add_new_submission_on_click'
    'keyup #new_submission'    : 'add_new_submission_on_enter'

  render: ->
    $('header').append(@$el.html(@template))
    @createCategoriesDropdown()
    $('#new_submission').focus()

  show: ->
    @$el.show()

  hide: ->
    @$el.hide()

  add_new_submission_on_click: (e)->
    e.preventDefault()
    @add_new_submission()

  add_new_submission_on_enter: (e)->
    e.preventDefault()
    $('.char-counter').text(140 - $('#new_submission').val().length)

  add_new_submission: (description)->
    @.undelegateEvents()
    category = $("#demo-htmlselect").data('ddslick').selectedData.value
    if category == '0'
      @showMessage('Error', 'Please select a category for your request', 'error')
      @.delegateEvents()
    else
      textarea = @$el.find('#new_submission')
      description = textarea.val()
      request = new App.Models.Request({ description: _.str.rtrim(description), category: category })
      request.on 'invalid', =>
        @showMessage('Error', 'Please write a description for your request', 'error')
        @.delegateEvents()
      request.save {},
        success: =>
          @collection.add request, { silent: true }
          @collection.trigger 'add-new', request
          textarea.val('')
          $('.char-counter').text('140')
          @.delegateEvents()
    

  createCategoriesDropdown: ->
    $("#demo-htmlselect").ddslick
      width: "55px"
      enableKeyboard: false
    $('.dd-container ul li:first').css('display', 'none')

  showMessage: (title, text, className ) ->
    $.gritter.add
      title: title
      text: text
      image: '/assets/transparent.png'
      class_name: className


