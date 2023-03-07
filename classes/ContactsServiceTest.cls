@IsTest
private class ContactsServiceTest {

    @isTest static void testGetContactInfo() {
        String recordId = createContact();
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
        System.assertEquals('John', thisContact.firstName);
        System.assertEquals('IT', thisContact.country);
        System.assertEquals('Black', thisContact.cardType);

    }

    @isTest static void testContactByCaseId() {
        String externalId = createContact();

        Contact ctt = [SELECT Id 
                       FROM Contact 
                       WHERE Uuid__c =:externalId]; 
        
        
        createCase(ctt.Id);

        Case cs = [SELECT Id
                   FROM Case
                   LIMIT 1];

        List<ContactProperties> cttInfo = ContactInfoController.getContacts(cs.Id);
        System.assertEquals('IT', cttInfo.get(0).country);
        System.assertEquals('Black', cttInfo.get(0).cardType);

    }

    static void createCase(Id cttId) {
        Case cs = new Case(
            Subject='Test Case',
            ContactId=cttId,
            Origin='Web' 
        );

        insert cs;
    }

    static String createContact() {       
        
        createProduct();

        Id productId = [SELECT Id FROM Product__c LIMIT 1].Id;

        // Create test record
        Contact contactTest = new Contact(
            FirstName='John',
            LastName='Doe',
            Country__c = 'IT',
            Card_Type__c = 'Black',
            Uuid__c = 'TEST-001-N26',
            Product__c = productId
            );

        insert contactTest;

        return contactTest.Uuid__c;
    }          

    static void createProduct() {
        Product__c productItBlack = new Product__c(
            Name = 'IT Black',
            Country__c = 'IT',
            CardType__c = 'Black',
            CostCalendarMonth__c = 9.90,
            ATMFeesOtherCurrencies__c = 0.00,
            CardReplacementCost__c = 6.00
        );

        insert productItBlack;

    }
}