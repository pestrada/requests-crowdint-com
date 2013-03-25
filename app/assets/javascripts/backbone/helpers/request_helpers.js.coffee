Handlebars.registerHelper 'can_vote', ()->
  if @can_vote then 'can-vote' else 'cant-vote'

Handlebars.registerHelper 'formatDate', (date)->
  moment(date).fromNow()

Handlebars.registerHelper 'formatSubmittedDate', (date)->
  requestDate = moment(date).format('MMMM Do YYYY, h:mm:ss a')
  aboutToExpire = moment().subtract('days', 1).format('MMMM Do YYYY, h:mm:ss a')
  formattedDate = moment(date).add('day', 7).fromNow()
  if requestDate >= aboutToExpire
    "<div class='aboutToExpire'>" + formattedDate + "</div>"
  else
    formattedDate

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
