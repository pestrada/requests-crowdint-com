class App.Models.Submission extends Backbone.Model
  urlRoot: '/api/submissions'

  validate: ->
    if @get('description') is ''
      return 'Validation Error'

  like: ->
    $.ajax
      type: 'POST'
      url: "/api/submissions/#{@id}/votes"
      success: (data, status, xhr)=>
        @set({ votes: data.votes })
        @trigger('accepted') if data.votes >= 10


class App.Collections.Submitted extends Backbone.Collection
  model: App.Models.Submission
  url: '/api/submissions'

class App.Collections.Accepted extends Backbone.Collection
  model: App.Models.Submission
  url: '/api/accepted'

