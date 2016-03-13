# Meteor.startup -> GoogleMaps.load()
#
# Template.location_list.onCreated ->
#     GoogleMaps.ready 'locationMap', (map) ->
#         console.log map
#         marker = new google.maps.Marker position: map.options.center, map: map.instance
#         console.log marker
#
# Template.location_list.helpers
#     mapOptions: ->
#         return {
#             center: new google.maps.LatLng -31.975442, 115.816709
#             zoom: 8
#         }

Template.location_list.helpers
    isReady: -> Router.current().ready()
