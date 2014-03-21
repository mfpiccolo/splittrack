App.initApp = (currentUser) ->
  console.log attributes = $('meta[name="current-user"]').attr('content')
  App.__container__.lookup('controller:auth').set 'currentUser', currentUser



