class App.Views.Submitted extends Backbone.View
  el: 'section.submission-list ul'

  template: HandlebarsTemplates['backbone/templates/submitted']

  render: ->
    @$el.append(@template(@model.toJSON()))
