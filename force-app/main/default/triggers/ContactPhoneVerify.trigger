trigger ContactPhoneVerify on Contact (after insert) {
    for (Contact c : Trigger.new) {
        if (c.Phone != null) {
            VeriphoneService.verifyPhoneNumber(c.Id, c.Phone);
        }
    }
}