Franchisees = new Meteor.Collection "franchisees"

prepareFranchise = (data) ->
    data.kp = data.kp == "on"
    data.payed = data.payed == "on"
    data
 
if Meteor.isClient
    Meteor.Router.add "/franchisees", "franchisees"

    Template.franchisees.rendered = () ->
        $("select").select2()
        if document.activeElement is document.body
            this.find("#s2id_bussinessFormat .select2-choice").focus()

    Template.franchisees.franchisees = Franchisees.find()

    Template.franchiseesForm.events
        "submit .franchisees-form": (event) ->
            event.preventDefault()
            Franchisees.insert prepareFranchise form2js event.target
            event.target.reset()
