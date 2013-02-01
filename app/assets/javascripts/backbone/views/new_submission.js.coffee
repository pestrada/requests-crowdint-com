class App.Views.NewSubmission extends Backbone.View
  el: 'section.form'

  template: HandlebarsTemplates['backbone/templates/new_submission']

  events:
    'click #add_new_submission': 'add_new_submission_on_click'
    'keyup #new_submission' : 'add_new_submission_on_enter'

  render: ->
    @$el.html(@template)

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
    description = textarea.val()
    textarea.val('')
    submission = @collection.create { description: description }, { silent: true }
    @collection.trigger 'add-new', submission
