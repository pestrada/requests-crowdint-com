class App.Routers.Application extends Backbone.Router
  routes:
    'requests/:id': 'showRequest'
    ''            : 'showRequestList'

  showRequestList: ->
    App.requests_view = new App.Views.SubmittedList({ collection: App.submitted_list }) unless App.requests_view?
    App.requests_view.render()
    App.promoted_view = new App.Views.PromotedList({ collection: App.promoted_list }) unless App.promoted_view?
    App.promoted_view.render()
    App.requests_view.initializeEndlessScrolling()
    App.promoted_view.initializeEndlessScrolling()
    App.form.show()

  showRequest: (id)->
    @showRequestList()
    request = $("#request-#{id}")
    if request.length > 0
      $('html, body').animate({ scrollTop: request.offset().top }, 'slow');
      request.effect('highlight', {}, 2000)
    else
      @navigate('')

class App.Routers.Admin extends App.Routers.Application
  adminRoutes:
    'admin' : 'showAdmin'

  initialize: ->
    _.extend @routes, @adminRoutes
    @_bindRoutes()

  showAdmin: ->
    console.log 'admin'
