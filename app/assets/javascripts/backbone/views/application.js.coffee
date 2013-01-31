class App.Views.Application extends Backbone.View
  el: 'body > .main'

  template: HandlebarsTemplates['backbone/templates/application']

  render: ->
    @$el.html(@template)
    App.form = new App.Views.NewSubmission({ collection: App.submitted_list })
    App.form.render()
