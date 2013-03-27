class App.Views.HistoryMenu extends Backbone.View
  
  el: '.history'

  template: HandlebarsTemplates["backbone/templates/historyMenu"]

  events:
    'click .time-filter .round-button'     : 'selectTime'
    'click .category-filter .round-button' : 'selectCategory'

  render: ->
    @$el.append @template
    App.promoted_h_view = new App.Views.PromotedListHistory({ collection: App.promoted_history_list })
    App.promoted_h_view.render()
    App.rejected_view = new App.Views.RejectedList({ collection: App.rejected_list })
    App.rejected_view.render()
    App.completed_view = new App.Views.CompletedList({ collection: App.completed_list })
    App.completed_view.render()

  selectTime: (ev)->
    unless $(ev.currentTarget).hasClass 'active'
      $('.time-filter .round-button').removeClass 'active'
      $(ev.currentTarget).addClass 'active'
      @applyFilter()

  selectCategory: (ev)->
    unless $(ev.currentTarget).hasClass 'active'
      $('.category-filter .round-button').removeClass 'active'
      $(ev.currentTarget).addClass 'active'
      @applyFilter()

  applyFilter: ->
    time = $('.time-filter .active').attr 'data-val'
    category = $('.category-filter .active').attr 'data-val'
    url = "/api/requests?time=" + time + "&category=" + category
    @getFilteredRequests(url)

  getFilteredRequests: (url)->
    promoted = []
    rejected = []
    completed = []
    $.ajax
      type: 'GET'
      url: url
      success: (data, status, xhr)=>
        for request in data
          switch request.state
            when 'rejected' then rejected.push request
            when 'done' then completed.push request
            else  promoted.push request
        @resetHistoryLists(promoted, rejected, completed)

  resetHistoryLists: (promoted, rejected, completed)->
    App.promoted_history_list.reset promoted
    App.completed_list.reset completed
    App.rejected_list.reset rejected
    App.promoted_h_view.collection = App.promoted_history_list
    App.promoted_h_view.render()
    App.completed_view.collection = App.completed_list
    App.completed_view.render()
    App.rejected_view.collection = App.rejected_list
    App.rejected_view.render()
