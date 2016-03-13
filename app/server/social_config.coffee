ServiceConfiguration.configurations.remove service: 'facebook'

ServiceConfiguration.configurations.insert
    service: 'facebook'
    appId:   Meteor.settings.private.facebook.appId
    secret:  Meteor.settings.private.facebook.key
