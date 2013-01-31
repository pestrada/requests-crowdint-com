class App.Models.Submission extends Backbone.Model
  urlRoot: '/api/submissions'

  validate: ->
    if @get('description') is ''
      return 'Validation Error'


class App.Collections.Submitted extends Backbone.Collection
  model: App.Models.Submission
  url: '/api/submissions'

class App.Collections.Accepted extends Backbone.Collection
  model: App.Models.Submission
  url: '/api/accepted'

