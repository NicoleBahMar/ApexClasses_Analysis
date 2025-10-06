public class InvoiceTotalBatch implements Database.Batchable<SObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, Name, Total_Amount__c, ' +
            '(SELECT Id, Amount__c FROM Invoice_Line_Items__r) ' +
            'FROM Invoice__c'
        );
    }
    
    public void execute(Database.BatchableContext bc, List<Invoice__c> scope) {
        List<Invoice__c> invoicesToUpdate = new List<Invoice__c>();
        
        for (Invoice__c invoice : scope) {
            SimpleCalculator calc = new SimpleCalculator();
            Integer runningTotal = 0;
            
            for (Invoice_Line_Item__c lineItem : invoice.Invoice_Line_Items__r) {
                if (lineItem.Amount__c != null) {
                    calc.add(runningTotal, Integer.valueOf(lineItem.Amount__c));
                    runningTotal = calc.getResult();
                }
            }
            
            invoice.Total_Amount__c = runningTotal;
            invoicesToUpdate.add(invoice);
            
            System.debug('Invoice ' + invoice.Name + ' Total: ' + runningTotal);
        }
        
        update invoicesToUpdate;
    }
    
    public void finish(Database.BatchableContext bc) {
        System.debug('Invoice calculation batch completed!');
    }
}