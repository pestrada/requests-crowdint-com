Handlebars.registerHelper 'can_vote', ()->
  if @can_vote then 'can-vote' else 'cant-vote'

Handlebars.registerHelper 'formatDate', (date)->
  moment(date).fromNow()

Handlebars.registerHelper 'formatSubmittedDate', (date)->
  moment(date).add('day', 7).fromNow()

Handlebars.registerHelper 'formatProcessedRequestDate', (date)->
  moment(date).format("MMM Do YY")

Handlebars.registerHelper 'detectLinks', (text)->
  text.autoLink()

Handlebars.registerHelper 'ifUserIsAdmin', (item, options)->
  if App.isAdmin
    options.fn(this)

Handlebars.registerHelper 'ifUserIsNotAdmin', (item, options)->
  if App.isAdmin is false
    options.fn(this)
