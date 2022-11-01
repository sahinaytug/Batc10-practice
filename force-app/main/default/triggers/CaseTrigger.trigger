trigger CaseTrigger on Case (after insert) {
    CaseTriggerHandler.CreateChildCase(Trigger.New);

}