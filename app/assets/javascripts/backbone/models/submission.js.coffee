class App.Models.Submission extends Backbone.Model
  urlRoot: '/api/submissions'

  defaults:
    votes: 0

  validate: ->
    if @get('description') is ''
      return 'Validation Error'

  like: ->
    $.ajax
      type: 'POST'
      url: "/api/submissions/#{@id}/votes"
      success: (data, status, xhr)=>
        @set({ votes: data.votes })
        @trigger('accepted') if data.votes >= App.votesLimit


class App.Collections.Submissions extends Backbone.Collection
  model: App.Models.Submission
  page: 1
  last_page: false

  nextPage: ->
    @page += 1
    @fetch
      data:
        page: @page
      remove: false
      update: true
      error: =>
        @last_page = true

  isLastPage: ->
    @last_page is true

class App.Collections.Submitted extends App.Collections.Submissions
  url: '/api/submissions'


class App.Collections.Accepted extends App.Collections.Submissions
  url: '/api/accepted'
