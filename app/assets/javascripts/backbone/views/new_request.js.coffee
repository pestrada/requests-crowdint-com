class App.Views.NewRequest extends Backbone.View
  el: 'section.form'

  template: HandlebarsTemplates['backbone/templates/new_request']

  events:
    'click #add_new_submission': 'add_new_submission_on_click'
    'keyup #new_submission' : 'add_new_submission_on_enter'

  render: ->
    $('header').append(@$el.html(@template))
    @createMoodDropdown()

  show: ->
    @$el.show()

  hide: ->
    @$el.hide()

  add_new_submission_on_click: (e)->
    e.preventDefault()
    @add_new_submission()

  add_new_submission_on_enter: (e)->
    e.preventDefault()
    if e.keyCode is 13
      @add_new_submission()

  add_new_submission: (description)->
    textarea = @$el.find('#new_submission')
    mood = $("#demo-htmlselect").data('ddslick').selectedData.value
    description = textarea.val()
    textarea.val('')
    request = new App.Models.Request({ description: description, mood: mood })
    request.save {},
      success: =>
        @collection.add request, { silent: true }
        @collection.trigger 'add-new', request

  createMoodDropdown: ->
    $("#demo-htmlselect").ddslick
      width: "55px"
      enableKeyboard: false
