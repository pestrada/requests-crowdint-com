class App.Views.PromotedList extends Backbone.View
  el: 'section.promoted-list'

  className: 'hidden'

  template: HandlebarsTemplates['backbone/templates/promoted_list']

  initialize: ->
    @collection.on 'add', @addOne, @
    @collection.on 'add-new', @addNew, @

  render: ->
    @$el.html @template
    @addAll()

  addAll: ->
    @collection.each @addOne, @

  addNew: (promoted)->
    view = new App.Views.Promoted({ model: promoted })
    @$el.find('ul.list').prepend view.render().el

  addOne: (promoted)->
    view_class = _.str.capitalize(promoted.get('state'))
    view = eval("new App.Views.#{view_class}({ model: promoted })")
    @$el.find('ul.list').append view.render().el

  initializeEndlessScrolling: ->
    $('promoted-list').endlessScroll
      fireOnce: false
      fireDelay: 10000
      ceaseFireOnEmpty: false
      callback: (f,p,s) =>
        @collection.nextPage()
      ceaseFire: =>
        @collection.isLastPage()
