trigger ContactTrigger on Contact (after insert) {
    ContactTriggerHandler.updateContactCount(Trigger.new);
}