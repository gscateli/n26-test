@IsTest
private class ContactsServiceTest {

    @isTest static void testGetCaseById() {
        String recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://wise-badger-km9e2g-dev-ed.trailblaze.salesforce.com/services/apexrest/Contacts/'
            + recordId;
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        ContactProperties thisContact = ContactsController.getContactByUUID();
        // Verify results
        System.debug(thisContact);
        System.assertEquals('John', thisContact.firstName);
    }

    static String createTestRecord() {       
        
        createFees();

        Id calendarCost = [SELECT Id FROM Cost_Calendar_Month__c LIMIT 1].Id;
        Id atmCost = [SELECT Id FROM ATM_Fees_Other_Currencies__c LIMIT 1].Id;
        Id replacementCost  = [SELECT Id FROM Card_Replacement_Cost__c LIMIT 1].Id;

        // Create test record
        Contact contactTest = new Contact(
            FirstName='John',
            LastName='Doe',
            Country__c = 'IT',
            Card_Type__c = 'Black',
            Uuid__c = 'TEST-001-N26',
            Cost_per_Calendar_Month__c = calendarCost,
            ATM_Fee_Other_Currencies__c = atmCost,
            Card_Replacement_Cost__c = replacementCost
            );

        insert contactTest;
        return contactTest.Uuid__c;
    }          

    static void createFees() {
        Cost_Calendar_Month__c calendarItBlack = new Cost_Calendar_Month__c(
            Name = 'IT Black',
            Country__c = 'IT',
            Card_Type__c = 'Black',
            Cost__c = 9.90
        );

        insert calendarItBlack;

        ATM_Fees_Other_Currencies__c atmItBlack = new ATM_Fees_Other_Currencies__c(
            Name = 'IT Black',
            Country__c = 'IT',
            Card_Type__c = 'Black',
            ATM_Fee__c = 0.00
        ); 

        insert atmItBlack;

        Card_Replacement_Cost__c cardItBlack = new Card_Replacement_Cost__c(
            Name = 'IT Black',
            Country__c = 'IT',
            Card_Type__c = 'Black',
            Cost__c = 6.00
        );

        insert cardItBlack;

    }
}