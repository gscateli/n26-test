@RestResource(urlMapping='/Contacts/*')
global with sharing class ContactsController {
    @HttpGet
    global static ContactProperties getContactByUUID() {
        RestRequest request = RestContext.request;
        ContactsService service =  new ContactsService();

        String externalId = request.requestURI.substring(
        request.requestURI.lastIndexOf('/') + 1);
        
        return service.getContactByUUID(new Set<String>{externalId});

    }
} 