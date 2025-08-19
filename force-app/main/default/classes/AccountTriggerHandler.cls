public with sharing class AccountTriggerHandler {
    public static void createFollowUpTask(List<Account> newAccounts) {
        List<Task> tasksToInsert = new List<Task>();

        for (Account acc : newAccounts) {
            if (acc.Name != null) {
                Task newTask = new Task();
                newTask.Subject = 'Follow up with new Account: ' + acc.Name;
                newTask.WhatId = acc.Id; // Link the task to the new account
                newTask.Status = 'Not Started';
                newTask.Priority = 'Normal';
                tasksToInsert.add(newTask);
            }
        }

        if (!tasksToInsert.isEmpty()) {
            insert tasksToInsert;
        }
    }
}