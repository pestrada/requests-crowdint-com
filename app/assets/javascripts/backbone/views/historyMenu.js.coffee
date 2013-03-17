class App.Views.HistoryMenu extends Backbone.View
  
  el: '.history'

  template: HandlebarsTemplates["backbone/templates/historyMenu"]

  render: ->
    @$el.append @template
    App.promoted_h_view = new App.Views.PromotedListHistory({ collection: App.promoted_history_list })
    App.promoted_h_view.render()
    App.rejected_view = new App.Views.RejectedList({ collection: App.rejected_list })
    App.rejected_view.render()
    App.completed_view = new App.Views.CompletedList({ collection: App.completed_list })
    App.completed_view.render()