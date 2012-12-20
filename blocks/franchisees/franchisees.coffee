Franchisees = new Meteor.Collection "franchisees"

prepareFranchise = (data) ->
    data.kp = data.kp == "on"
    data.payed = data.payed == "on"
    data
 
if Meteor.isClient
    Template.franchisees.franchisees = Franchisees.find()
    
    Template.franchiseesForm.events
        "submit .franchisees-form": (event) ->
            event.preventDefault()
            Franchisees.insert prepareFranchise form2js event.target
            event.target.reset()
