Router.configure
    layoutTemplate: "master"
    loadingTemplate: "loading"
    notFoundTemplate: "not_found"

Router.route '/location/:_id',
    name: 'location'
    subscriptions: -> [
        Meteor.subscribe 'location', @params._id
        Meteor.subscribe 'coffees'
    ]
    data: -> Locations.findOne @params._id
    yieldTemplates:
        location_info:
            to: 'info'

Router.route '/',
    name: 'home'
    subscriptions: -> Meteor.subscribe 'locations'
    data: -> locations: Locations.find()
    yieldTemplates:
        home:
            to: 'info'
