global with sharing class ContactProperties {
    
    public String id {get; set;} 
    public String uuid {get; set;} 
    public String firstName {get; set;}
    public String lastName {get; set;}
    public String country {get; set;}
    public String cardType {get; set;}
    public String description {get; set;}

    public String costCalendarMonth {
        get {
            return costCalendarMonth;
        } set {
            costCalendarMonth = value == null ? 'N/a' : country == 'UK' ? '£' + value : '€' + value;
        }
    }
    public String atmFeeOtherCurrencies {
        get {
            return atmFeeOtherCurrencies;
        } set {
            atmFeeOtherCurrencies = Integer.valueOf(value) > 0 ? value + '%' : 'Free';
        }
    }
    public String cardReplacementCost {
        get {
            return cardReplacementCost;
        } set {
            cardReplacementCost = country == 'UK' ? '£' + value : '€' + value;
        }
    }


}