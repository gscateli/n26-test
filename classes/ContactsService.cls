public with sharing class ContactsService {
    
    public ContactProperties getContactByUUID(Set<String> setExternalIds) {
        ContactsSelector cttSelector = new ContactsSelector();
                
        return formatContactFields(cttSelector.selectById(setExternalIds));
    }

    public List<ContactProperties> getContactByCaseId(Id caseId){
        ContactsSelector cttSelector = new ContactsSelector();
        List<ContactProperties> lstCttProperties = new List<ContactProperties>();
        
        lstCttProperties.add(formatContactFields(cttSelector.selectByCaseId(caseId)));

        return lstCttProperties;
    }


    public ContactProperties formatContactFields(List<Contact> lstContacts) {

        ContactProperties cttProperties = new ContactProperties();

        if (lstContacts.get(0).id != null) {
            cttProperties.id = lstContacts.get(0).Id;
            cttProperties.uuid = lstContacts.get(0).Uuid__c;
            cttProperties.firstName = lstContacts.get(0).FirstName;
            cttProperties.lastName = lstContacts.get(0).LastName;
            cttProperties.country = lstContacts.get(0).Country__c;
            cttProperties.cardType = lstContacts.get(0).Card_Type__c;
            cttProperties.costCalendarMonth = String.valueOf(lstContacts.get(0).Cost_per_Calendar_Month__r.Cost__c);
            cttProperties.atmFeeOtherCurrencies = String.valueOf(lstContacts.get(0).ATM_Fee_Other_Currencies__r.ATM_Fee__c);
            cttProperties.cardReplacementCost = String.valueOf(lstContacts.get(0).Card_Replacement_Cost__r.Cost__c);
        } else {
            cttProperties.description = 'No contacts found with this external Id.';
        }

        return cttProperties;
    }
}