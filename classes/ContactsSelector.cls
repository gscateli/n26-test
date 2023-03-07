public with sharing class ContactsSelector {


    public List<Contact> selectById(Set<String> idSet) {
        return (List<Contact>) selectByContactExternalId(idSet);
    }

    public List<Contact> selectByCaseId(Id caseId) {
        return (List<Contact>) selectCttByCaseId(caseId);
    }

    public List<Contact> selectByContactExternalId(Set<String> idSet) {
        List<Contact> cttLst = new List<Contact>();

            cttLst =  
                [
                    SELECT Id, UUID__c, FirstName, LastName, Country__c, Card_Type__c, Product__r.ATMFeesOtherCurrencies__c, Product__r.CostCalendarMonth__c, Product__r.CardReplacementCost__c                   
                    FROM Contact 
                    WHERE UUID__c IN :idSet
                ];
            
            return cttLst;

    }

    public List<Contact> selectCttByCaseId(Id caseId) {
        List<Case> lstCase = [SELECT Id, ContactId 
                              FROM Case 
                              WHERE Id =: caseId];

        return [SELECT Id, FirstName, LastName, UUID__c, Country__c, Card_Type__c, Product__r.ATMFeesOtherCurrencies__c, Product__r.CostCalendarMonth__c, Product__r.CardReplacementCost__c                
                FROM Contact 
                WHERE Id =: lstCase.get(0).ContactId];
    }
}