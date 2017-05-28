$( document ).on 'ready page:load', ( event ) ->
  $( ".select2" ).select2({
      theme: "bootstrap",
      width: '100%'
  })
