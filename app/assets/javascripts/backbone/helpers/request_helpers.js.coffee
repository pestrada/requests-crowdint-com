Handlebars.registerHelper 'remove_domain', (email)->
  idx = email.indexOf('@')
  email.substring(0, idx)

Handlebars.registerHelper 'can_vote', (can_vote)->
  if can_vote then 'can-vote' else 'cant-vote'
