trigger AccountTrigger on Account (after insert, after update) {

    if (Trigger.isAfter && Trigger.isInsert) {
        // Call the static method from the AccountHandler class
        AccountTriggerHandler.createFollowUpTask(Trigger.new);
    }


    if (Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)) {
        AccountTriggerHandler.updateAccountDescription(Trigger.new);
    }
}
