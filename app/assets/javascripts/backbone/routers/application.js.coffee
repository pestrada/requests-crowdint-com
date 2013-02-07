class App.Routers.Application extends Backbone.Router
  routes:
    ''         : 'showSubmissionList'
    'promoted' : 'showPromotedList'

  showSubmissionList: ->
    $(document).off('scroll')
    App.submissions_view = new App.Views.SubmissionsList({ collection: App.submitted_list }) unless App.submissions_view?
    App.submissions_view.render()
    App.submissions_view.initializeEndlessScrolling()
    App.form.show()

  showPromotedList: ->
    $(document).off('scroll')
    App.form.hide()
    App.promoted_view = new App.Views.PromotedList({ collection: App.promoted_list }) unless App.promoted_view?
    App.promoted_view.render()
    App.promoted_view.initializeEndlessScrolling()


class App.Routers.Admin extends App.Routers.Application
  adminRoutes:
    'admin' : 'showAdmin'

  initialize: ->
    _.extend @routes, @adminRoutes
    @_bindRoutes()

  showAdmin: ->
    console.log 'admin'
