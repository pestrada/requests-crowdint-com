class App.Views.Application extends Backbone.View
  el: 'body > .main'

  template: HandlebarsTemplates['backbone/templates/application']

  initialize: ->
    @initializePusher()

  render: ->
    @$el.html(@template(App.current_user))
    @scrollCheck()

  initializePusher: ->
    App.pusher = new Pusher(App.pusherKey)
    App.channel = App.pusher.subscribe('crowdint_requests')
    new Backpusher(App.channel)

  scrollCheck: ->
    $h = $("header")
    $c = $(".container")
    $window = $(window)
    $window.scroll ->
      if $(this).scrollTop() >= 235
        $h.addClass "fixedHeader"
        $c.addClass "marginToClearHeader"
      else
        $h.removeClass "fixedHeader"
        $c.removeClass "marginToClearHeader"

