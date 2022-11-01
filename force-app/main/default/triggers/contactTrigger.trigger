trigger contactTrigger on Contact (before insert) {
    contacthandler_assg.updateContactPhone(trigger.new);

}