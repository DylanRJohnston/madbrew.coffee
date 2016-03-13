@Checkout = null
ctx = @

Template.coffee_list.helpers
    coffees: -> Coffees.find {}
    processing: -> Session.get 'processing'
    isReady: -> Router.current().ready()

Template.coffee_list.onCreated ->
    ctx.Checkout = StripeCheckout.configure
        key: Meteor.settings.public.stripe
        image: '/madbrew_logo.png'
        locale: 'auto'
        currency: 'AUD'
        token: (token) ->
            coffeeId = Session.get 'selectedCoffee'

            console.log token, coffeeId

            Meteor.call 'processNewPayment', coffeeId, token.id, (error, reponse) ->
                Session.set 'processing', false
                if error
                    Bert.alert error.reason, 'danger'
                    return

                Bert.alert 'Enjoy your cold brew. How\'s that in your tum?', 'success'

        closed: -> Session.set 'processing', false
