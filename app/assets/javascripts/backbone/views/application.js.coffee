class App.Views.Application extends Backbone.View
  el: 'body > .main'

  template: HandlebarsTemplates['backbone/templates/application']

  initialize: ->
    @initializePusher()

  render: ->
    @$el.html(@template)
    App.form = new App.Views.NewRequest({ collection: App.submitted_list })
    App.form.render()

  initializePusher: ->
    App.pusher = new Pusher(App.pusherKey)
    App.channel = App.pusher.subscribe('crowdint_requests')
    new Backpusher(App.channel)
