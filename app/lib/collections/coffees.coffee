@Coffees = new Mongo.Collection 'coffees'

Coffees.attachSchema new SimpleSchema
    name:
        type: String
    description:
        type: String
    tasting_notes:
        type: String
    'taste.roast':
        type: Number
    'taste.body':
        type: Number
    'taste.acidity':
        type: Number
    image:
        type: String
    price:
        type: Number
    item_id:
        type: String
