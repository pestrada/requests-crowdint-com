class App.Views.Accepted extends Backbone.View
  el: 'section.submission-list ul'

  template: HandlebarsTemplates['backbone/templates/accepted']

  render: ->
    @$el.append(@template(@model.toJSON()))
