Template.coffee.helpers
    inDollars: (amount) -> amount / 100
    processing: -> Session.get 'processing'
    existingUser: -> Meteor.user().profile.stripeId?

Template.coffee.events
    'click a': (event, template) ->
        console.log 'clicked'

        Session.set 'selectedCoffee', @_id
        Session.set 'processing', true

        user = Meteor.user()

        if user.profile.stripeId?
            Meteor.call 'chargeExistingCustomer', @_id, user.profile.stripeId, (error, response) ->
                Session.set 'processing', false
                if error
                    Bert.alert error.reason, 'danger'
                    return

                Bert.alert 'Enjoy your cold brew. How\'s that in your tum?', 'success'
        else
            Checkout.open
                name: 'Madbrew Coffee'
                description: @name
                amount: @price
                bitcoin: true
