class App.Models.Submission extends Backbone.Model
  urlRoot: '/api/submissions'


class App.Collections.Submitted extends Backbone.Collection
  model: App.Models.Submission
  url: '/api/submissions'

class App.Collections.Accepted extends Backbone.Collection
  model: App.Models.Submission
  url: '/api/accepted'

