@Locations = new Mongo.Collection 'locations'

Locations.attachSchema new SimpleSchema
    name:
        type: String
    description:
        type: String
    address:
        type: String
    image:
        type: String
    'location.lattitude':
        type: Number
        decimal: true
    'location.longitude':
        type: Number
        decimal: true
