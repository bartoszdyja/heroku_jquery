# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  @showMapForm = ->
    $(".show_map").toggle()
    $("#advertisement_address").hide()
    $("#map_link").hide()
    L.mapbox.accessToken = 'pk.eyJ1IjoibmV0Z3VydXdvcmtzaG9wcyIsImEiOiIwODdmZmNlYTViMzMxZTQyY2U5NjI1NWVmMGI4MzI1YSJ9.pTSx-gR1dHPt2lmMutPIZQ'
    map = L.mapbox.map('map', 'netguruworkshops.na5f19j3')
      .setView([52.41, 16.94], 14)
    featureLayer = L.mapbox.featureLayer().addTo(map)
    click = document.getElementById('click')

    map.on 'click', (e) ->
      featureLayer.setGeoJSON
        type: 'Feature'
        geometry:
          type: 'Point'
          coordinates: [
            e.latlng.lng
            e.latlng.lat
          ]
    return