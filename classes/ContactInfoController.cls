public with sharing class ContactInfoController {
    @AuraEnabled
    public static List<Contact> getContacts(Id recordId){

        List<Case> lstCase = [SELECT Id, ContactId FROM Case WHERE Id =: recordId];

        List<Contact> lstContact = [SELECT Id, FirstName, LastName, Country__c, Card_Type__c FROM Contact WHERE Id =: lstCase.get(0).ContactId];

        return lstContact;
    }
}