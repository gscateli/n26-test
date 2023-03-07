public with sharing class ContactInfoController {
    @AuraEnabled
    public static List<ContactProperties> getContacts(Id recordId){
        ContactsService cttService = new ContactsService();

        return cttService.getContactByCaseId(recordId);
    }
}