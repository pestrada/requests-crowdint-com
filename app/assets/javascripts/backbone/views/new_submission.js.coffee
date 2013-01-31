class App.Views.NewSubmission extends Backbone.View
  el: 'section.form'

  template: HandlebarsTemplates['backbone/templates/new_submission']

  events:
    'click #add_new_submission': 'add_new_submission'

  render: ->
    @$el.html(@template)

  show: ->
    @$el.show()

  hide: ->
    @$el.hide()

  add_new_submission: (e)->
    e.preventDefault()
    textarea = @$el.find('#new_submission')
    description = textarea.val()
    @collection.create { description: description }
    textarea.val('')
