class App.Routers.Application extends Backbone.Router
  routes:
    ''         : 'showSubmissionList'
    'accepted' : 'showAcceptedList'

  showSubmissionList: ->
    $(document).off('scroll')
    App.submissions_view = new App.Views.SubmissionsList({ collection: App.submitted_list }) unless App.submissions_view?
    App.submissions_view.render()
    App.submissions_view.initializeEndlessScrolling()
    App.form.show()

  showAcceptedList: ->
    $(document).off('scroll')
    App.form.hide()
    App.accepted_view = new App.Views.AcceptedList({ collection: App.accepted_list }) unless App.accepted_view?
    App.accepted_view.render()
    App.accepted_view.initializeEndlessScrolling()
