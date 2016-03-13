Template.location_summary.events
    'click .list-group-item': (event, template) ->
        console.log "Derps"
        event.preventDefault()

        Router.go 'location', _id: @_id
