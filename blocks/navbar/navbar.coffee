if Meteor.isClient
    Template.navbar.events
        "click a": (event) ->
            event.preventDefault()
            Meteor.Router.to event.target.attributes.href.value
