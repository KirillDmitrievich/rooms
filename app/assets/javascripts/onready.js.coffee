when_page_ready = ->
  $(".gllpLatlonPicker").each ->
    $(document).gMapsLatLonPicker().init( $(this) )

$(document).on 'page:load', ->
  when_page_ready()

$(document).ready ->
  when_page_ready()