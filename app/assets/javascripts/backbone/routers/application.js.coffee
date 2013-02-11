class App.Routers.Application extends Backbone.Router
  routes:
    'requests/:id': 'showRequest'
    ''            : 'showSubmissionList'

  showSubmissionList: ->
    App.submissions_view = new App.Views.SubmissionsList({ collection: App.submitted_list }) unless App.submissions_view?
    App.submissions_view.render()
    App.promoted_view = new App.Views.PromotedList({ collection: App.promoted_list }) unless App.promoted_view?
    App.promoted_view.render()
    App.submissions_view.initializeEndlessScrolling()
    App.promoted_view.initializeEndlessScrolling()
    App.form.show()

  showRequest: (id)->
    @showSubmissionList()
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
