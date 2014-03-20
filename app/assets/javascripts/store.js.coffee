Splittrack.Store = DS.Store.extend
  revision: 11

# Allows you to send requests to rails api
$(->
  token = $('meta[name="csrf-token"]').attr('content')
  $.ajaxPrefilter((options, originalOptions, xhr)->
    xhr.setRequestHeader('X-CSRF-Token', token)
  )
)
