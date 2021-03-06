class App.Routers.Application extends Backbone.Router
  routes:
    ''            : 'showRequestList'
    'requests/:id': 'showRequest'
    'history'     : 'showHistory'
    'history-requests/:id' : 'showRequestInHistory'

  showRequestList: ->
    if App.histoyMenu_view then App.histoyMenu_view.$el.empty()
    App.form = new App.Views.NewRequest({ collection: App.submitted_list }) unless App.form?
    App.form.render()
    App.requests_view = new App.Views.SubmittedList({ collection: App.submitted_list }) unless App.requests_view?
    App.requests_view.render()
    App.promoted_view = new App.Views.PromotedList({ collection: App.promoted_list }) unless App.promoted_view?
    App.promoted_view.render()
    @setTooltips()

  showRequest: (id)->
    @showRequestList()
    request = $("#request-#{id}")
    if request.length > 0
      $('html, body').animate({ scrollTop: request.offset().top - 80}, 'slow');
      request.effect('highlight', {}, 2000)
      request.addClass('selected')
    else
      @navigate('')

  showHistory: ->
    if App.form? then App.form.$el.empty()
    if App.requests_view? then App.requests_view.$el.empty()
    if App.promoted_view? then App.promoted_view.$el.empty()
    App.histoyMenu_view = new App.Views.HistoryMenu() unless App.histoyMenu_view?
    App.histoyMenu_view.render()
    @setTooltips()

  showRequestInHistory: (id)->
    @showHistory()
    request = $("#request-#{id}")
    if request.length > 0
      $('html, body').animate({ scrollTop: request.offset().top - 80}, 'slow');
      request.effect('highlight', {}, 2000)
      request.addClass('selected')
    else
      @navigate('history')

  setTooltips: ->
    $(".votes").each ->
      $(this).qtip
        content:
          text: $(this).find('.supporters').html()
        show: "mouseover"
        hide: "mouseout"
        position:
          corner:
            target: 'rightMiddle'
            tooltip: 'leftMiddle'
        style:
          name: 'dark'
          lineHeight: '20px'
          tip: 'leftMiddle'

class App.Routers.Admin extends App.Routers.Application
  adminRoutes:
    'admin' : 'showAdmin'

  initialize: ->
    _.extend @routes, @adminRoutes
    @_bindRoutes()

  showAdmin: ->
    console.log 'admin'
