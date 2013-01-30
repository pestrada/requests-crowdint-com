class App.Routers.Application extends Backbone.Router
  routes:
    ''         : 'showSubmissionList'
    'accepted' : 'showAcceptedList'

  showSubmissionList: ->
    App.submissions_view = new App.Views.SubmissionsList({ collection: App.submitted_list }) unless App.submissions_view?
    App.submissions_view.render()

  showAcceptedList: ->
    App.accepted_view = new App.Views.AcceptedList({ collection: App.accepted_list }) unless App.accepted_view?
    App.accepted_view.render()
