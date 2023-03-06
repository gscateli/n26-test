public with sharing class ContactInfoController {
    @AuraEnabled
    public static List<Contact> getContacts(Id recordId){
        ContactsSelector cttSelector = new ContactsSelector();

        return cttSelector.selectByCaseId(recordId);
    }
}