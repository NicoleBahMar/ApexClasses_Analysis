public class ExecuteInvoiceBatch {
    
    public ExecuteInvoiceBatch() {
        InvoiceTotalBatch batch = new InvoiceTotalBatch();
        
        Id batchJobId = Database.executeBatch(batch, 200);
        
        System.debug('Invoice Total Batch started with Job ID: ' + batchJobId);
    }
    
    // Alternative: Static method for more flexibility
    public static void runBatch() {
        InvoiceTotalBatch batch = new InvoiceTotalBatch();
        Database.executeBatch(batch, 200);
    }
    
    // Alternative: With custom batch size
    public static void runBatch(Integer batchSize) {
        InvoiceTotalBatch batch = new InvoiceTotalBatch();
        Database.executeBatch(batch, batchSize);
    }
}