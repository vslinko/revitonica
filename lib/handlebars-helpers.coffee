if Meteor.isClient
    Handlebars.registerHelper "boolean", (value) ->
        iconClass = if value then "icon-ok" else "icon-remove"
        new Handlebars.SafeString("<i class=\"#{iconClass}\"></i>")


    Handlebars.registerHelper "null", (value) ->
        if value then value else new Handlebars.SafeString('<i class="icon-minus"></i>')
