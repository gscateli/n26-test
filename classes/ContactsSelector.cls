public with sharing class ContactsSelector {


    public List<Contact> selectById(Set<String> idSet) {
        return (List<Contact>) selectByContactExternalId(idSet);
    }

    public List<Contact> selectByContactExternalId(Set<String> idSet) {
        List<Contact> cttLst = new List<Contact>();

            cttLst =  
                [
                    SELECT Id, UUID__c, FirstName, LastName, Country__c, Card_Type__c, Cost_per_Calendar_Month__r.Cost__c, ATM_Fee_Other_Currencies__r.ATM_Fee__c, Card_Replacement_Cost__r.Cost__c 
                    FROM Contact 
                    WHERE UUID__c IN :idSet                
                ];

            if (cttLst.size() == 0) {
                cttLst.add(new Contact(LastName='no contacts found'));
            }
            
            return cttLst;

    }
}