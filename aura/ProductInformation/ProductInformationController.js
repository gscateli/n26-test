({
    retrieveContactInfo : function(component, event, helper) {
        var action = component.get("c.getContacts");

        component.set("v.Columns", [
            // {label:"First Name", fieldName:"FirstName", type:"text"},
            // {label:"Last Name", fieldName:"LastName", type:"text"},
            {label:"Card Type", fieldName:"Card_Type__c", type:"text"},
            {label:"Country", fieldName:"Country__c", type:"text"}
        ]);
        
        action.setParams({
            recordId: component.get("v.recordId")
        });

        action.setCallback(this, function(data) {
            let cttInfo = data.getReturnValue();
            component.set("v.Contacts", data.getReturnValue());
            component.set("v.ContactInfo", cttInfo[0]);
        });

        $A.enqueueAction(action);
    }
})
