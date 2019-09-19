public with sharing class AutoPopulateExample{
    public list<Ticket_Booking__c> ticket{get;set;}
    public List<Fare_Price__c> updatedFairPrice {get;set;}
    public Integer noOfPassengers{get;set;}
    public Decimal TotalFair{get;set;}
    public Fare_Price__c Testing {get;set;}
  
    public AutoPopulateExample(ApexPages.StandardController controller)
    {
        
        Testing = new Fare_Price__c();
    }
    
    public Decimal display()      
    {
        if(testing.Date__c==null || testing.Date__c<date.today()||testing.Date__c>date.today()+30)
        {
            apexpages.addMessage(new apexpages.message(Apexpages.Severity.ERROR,'Please enter valid date'));
        }
        else if(testing.From__c==null ||testing.To__c==null )

            {
            apexpages.addMessage(new apexpages.message(Apexpages.Severity.ERROR,'You have to enter both From and To fields to get your data'));
           }
        
        else if(testing.Class__c==null)
            
        {
            apexpages.addMessage(new apexpages.message(Apexpages.Severity.ERROR,'Select Your Type of seat'));
        }
        else 
        {
         updatedFairPrice = [SELECT Total_Fare__c,Train__c,id,From__c,To__c,Amount__c  FROM Fare_Price__c WHERE From__c=:Testing.From__c AND To__c=:Testing.To__c AND Class__c=:Testing.Class__c limit 1];
        
        TotalFair = noOfPassengers* updatedFairPrice[0].Amount__c ;
        }
        return null;
     
    } 
    
    public pagereference book()
        
    {
        
        pagereference pg=new pagereference('/apex/onsubmit?att='+noOfPassengers+'&&att1='+Testing.From__c+'&&att2='+testing.To__c+'&&att3='+Testing.class__c);
        return pg;
    }
    
}