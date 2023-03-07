global with sharing class ContactProperties {
    
    @AuraEnabled public String id {get; set;} 
    @AuraEnabled public String uuid {get; set;} 
    @AuraEnabled public String firstName {get; set;}
    @AuraEnabled public String lastName {get; set;}
    @AuraEnabled public String country {get; set;}
    @AuraEnabled public String cardType {get; set;}
    @AuraEnabled public String description {get; set;}

    @AuraEnabled public String costCalendarMonth {
        get {
            return costCalendarMonth;
        } set {
            costCalendarMonth = value == null ? 'N/a' : country == 'UK' ? '£' + value : '€' + value;
        }
    }

    @AuraEnabled public String atmFeeOtherCurrencies {
        get {
            return atmFeeOtherCurrencies;
        } set {
            atmFeeOtherCurrencies = Double.valueOf(value) > 0 ? value + '%' : 'Free';
        }
    }
    
    @AuraEnabled public String cardReplacementCost {
        get {
            return cardReplacementCost;
        } set {
            cardReplacementCost = country == 'UK' ? '£' + value : '€' + value;
        }
    }


}