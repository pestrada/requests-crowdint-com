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
      url: "/api/submissions/#{@id}/vote"
      success: (data, status, xhr)=>
        @set({ votes: data.votes })
        @trigger('promoted') if data.votes >= App.votesLimit

  accept: ->
    $.ajax
      type: 'POST'
      url: "/api/submissions/#{@id}/accept"
      success: (data, status, xhr)=>
        @trigger('accepted')

  reject: ->
    $.ajax
      type: 'POST'
      url: "/api/submissions/#{@id}/reject"
      success: (data, status, xhr)=>
        @trigger('rejected')

  complete: ->
    $.ajax
      type: 'POST'
      url: "/api/submissions/#{@id}/complete"
      success: (data, status, xhr)=>
        @trigger('completed')


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


class App.Collections.Promoted extends App.Collections.Submissions
  url: '/api/submissions?state=processed'
