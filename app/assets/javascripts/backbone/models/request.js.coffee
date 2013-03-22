class App.Models.Request extends Backbone.Model
  urlRoot: '/api/requests'

  defaults:
    votes: 0
    comments: []

  validate: ->
    if @get('description') is '' || @get('description').length > 140
      return 'Validation Error'

  like: ->
    $.ajax
      type: 'POST'
      url: "/api/requests/#{@id}/vote"
      success: (data, status, xhr)=>
        @set({ votes: data.votes })
        @promote() if data.votes >= App.votesLimit

  comment: (comment)->
    $.ajax
      type: 'POST'
      url: "/api/requests/#{@id}/comment"
      data: {comment: comment}
      success: (data, status, xhr)=>
        @set('comments', data.comments)
        @trigger('commented')

  promote: ->
    $.ajax
      type: 'POST'
      url: "/api/requests/#{@id}/promote"
      success: (data, status, xhr)=>
        @trigger('promoted')

  accept: ->
    $.ajax
      type: 'POST'
      url: "/api/requests/#{@id}/accept"
      success: (data, status, xhr)=>
        @trigger('accepted')

  reject: ->
    $.ajax
      type: 'POST'
      url: "/api/requests/#{@id}/reject"
      success: (data, status, xhr)=>
        @trigger('rejected')

  complete: ->
    $.ajax
      type: 'POST'
      url: "/api/requests/#{@id}/complete"
      success: (data, status, xhr)=>
        @trigger('completed')


class App.Collections.Requests extends Backbone.Collection
  model: App.Models.Request
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

class App.Collections.Submitted extends App.Collections.Requests
  url: '/api/requests'


class App.Collections.Promoted extends App.Collections.Requests
  url: '/api/requests?state=processed'

class App.Collections.Rejected extends App.Collections.Requests
  url: '/api/requests?state=rejected'

class App.Collections.Completed extends App.Collections.Requests
  url: '/api/requests?state=done'
