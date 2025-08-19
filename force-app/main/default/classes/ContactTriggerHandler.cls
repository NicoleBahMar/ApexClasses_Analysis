public class ContactTriggerHandler {
    public static void updateContactCount(List<Contact> newContacts) {
        Set<Id> accountIds = new Set<Id>();
        for (Contact con : newContacts) {
            if (con.AccountId != null) {
                accountIds.add(con.AccountId);
            }
        }

        List<Account> accountsToUpdate = [
            SELECT Id, Number_of_Contacts__c,
            (SELECT Id FROM Contacts)
            FROM Account
            WHERE Id IN :accountIds
        ];

        for (Account acc : accountsToUpdate) {
            acc.Number_of_Contacts__c = acc.Contacts.size();
        }

        update accountsToUpdate;
    }
}