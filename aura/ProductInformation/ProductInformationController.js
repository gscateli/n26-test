({
    retrieveContactInfo : function(component, event, helper) {
        var action = component.get("c.getContacts");

        component.set("v.Columns", [
            // {label:"First Name", fieldName:"FirstName", type:"text"},
            // {label:"Last Name", fieldName:"LastName", type:"text"},
            {label:"Card Type", fieldName:"cardType", type:"text"},
            {label:"Country", fieldName:"country", type:"text"}
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
