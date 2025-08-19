trigger AccountTrigger on Account (after insert) {

    if (Trigger.isAfter && Trigger.isInsert) {
        // Call the static method from the AccountHandler class
        AccountTriggerHandler.createFollowUpTask(Trigger.new);
    }
}