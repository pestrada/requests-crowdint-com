Handlebars.registerHelper 'can_vote', (can_vote)->
  if can_vote then 'can-vote' else 'cant-vote'
