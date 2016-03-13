Stripe = StripeAPI Meteor.settings.private.stripe

Meteor.methods
    processNewPayment: (coffeeId, token) ->
        check Meteor.userId(), String
        check coffeeId, String
        check token, String

        @unblock()

        coffee = Coffees.findOne _id: coffeeId

        throw new Meteor.Error 'invalid-coffee', 'A coffee with that ID does not exist.' unless coffee?

        user = Meteor.user()

        createUser = Meteor.wrapAsync Stripe.customers.create, Stripe.customers
        userObject =
            source: token
            email: user.services.facebook.email
            metadata:
                first_name: user.services.facebook.first_name
                last_name: user.services.facebook.last_name
                userId: user._id

        {id: userStripeId} = createUser userObject
        Meteor.users.update user._id, $set: {'profile.stripeId': userStripeId}

        charge =
            customer: userStripeId
            amount: 400
            currency: 'AUD'
            description: coffee.name

        handleCharge = Meteor.wrapAsync Stripe.charges.create, Stripe.charges
        payment      = handleCharge charge

        return payment

    chargeExistingCustomer: (coffeeId, userStripeId) ->
        check Meteor.userId(), String
        check coffeeId, String
        check userStripeId, String

        @unblock()

        coffee = Coffees.findOne _id: coffeeId

        throw new Meteor.Error 'invalid-coffee', 'A coffee with that ID does not exist.' unless coffee?

        user = Meteor.user()

        throw new Meteor.Error 'invalid-customer-id', 'The current logged in user and their stripe token do not match.' unless user.profile.stripeId is userStripeId

        charge =
            customer: userStripeId
            amount: 400
            currency: 'AUD'
            description: coffee.name

        handleCharge = Meteor.wrapAsync Stripe.charges.create, Stripe.charges
        payment      = handleCharge charge

        return payment
