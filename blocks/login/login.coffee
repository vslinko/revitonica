if Meteor.isClient
    email = password = ""

    checkEnabled = () ->
        emailValid = /^.+@.+\..+$/.test email
        passwordValid = password.length > 4
        
        Session.set "login-enabled", emailValid and passwordValid

    Template.login.helpers
        disabled: () ->
            if Session.get "login-enabled" then "" else "disabled"
        
        error: () ->
            Session.get "login-error"

    Template.login.events
        "input .login-email": (event) ->
            email = event.target.value
            checkEnabled()

        "input .login-password": (event) ->
            password = event.target.value
            checkEnabled()

        "submit .login-form": (event) ->
            event.preventDefault()

            Meteor.loginWithPassword email, password, (error) ->
                if error
                    Session.set "login-error", error.reason
                else
                    Meteor.Router.to "/"
