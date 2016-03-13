Meteor.publish 'coffees', -> Coffees.find()

Meteor.publish 'locations', -> Locations.find()
Meteor.publish 'location', (id) ->
    check id, String
    Locations.find _id: id
