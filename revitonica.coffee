if Meteor.isClient
    Meteor.Router.add
        "/": "home"
        "/logout": () -> Meteor.logout () -> Meteor.Router.to "/"

    Meteor.Router.filters
        checkLoggedIn: (page) ->
            if Meteor.user() then page else "login"

    Meteor.Router.filter "checkLoggedIn"


if Meteor.isServer
    Meteor.startup () ->
        if not Meteor.users.findOne {"emails.address": "vyacheslav.slinko@gmail.com"}
            Accounts.createUser
                email: "vyacheslav.slinko@gmail.com"
                password: "password"
