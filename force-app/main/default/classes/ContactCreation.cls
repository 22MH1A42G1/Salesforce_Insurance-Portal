public class ContactCreation {
    
    // ----------------------------
    // Request Wrapper (Inputs)
    // ----------------------------
    public class ContactRequest {
        @InvocableVariable(label='Last Name' description='Last name of the contact' required=true)
        public String lastName;

        @InvocableVariable(label='Email' description='Email address of the contact' required=true)
        public String email;

        @InvocableVariable(label='Phone' description='Phone number of the contact')
        public String phone;
    }

    // ----------------------------
    // Response Wrapper (Outputs)
    // ----------------------------
    public class Response {
        @InvocableVariable(label='Contact Id' description='Id of the created Contact')
        public Id contactId;

        @InvocableVariable(label='Message' description='Result message of the operation')
        public String message;
    }

    // ----------------------------
    // Invocable Method (Agent Action entry point)
    // ----------------------------
    @InvocableMethod(label='Create Contact' description='Creates one or more contacts based on input')
    public static List<Response> createContacts(List<ContactRequest> requests) {
        List<Response> responses = new List<Response>();
        List<Contact> contactsToInsert = new List<Contact>();

        // Build the Contact list
        for (ContactRequest req : requests) {
            if (String.isNotBlank(req.lastName) && String.isNotBlank(req.email)) {
                contactsToInsert.add(new Contact(
                    LastName = req.lastName,
                    Email    = req.email,
                    Phone    = req.phone
                ));
            } else {
                Response r = new Response();
                r.message = 'Skipped: Last Name and Email are required.';
                responses.add(r);
            }
        }

        // Insert Contacts
        if (!contactsToInsert.isEmpty()) {
            try {
                insert contactsToInsert;

                for (Contact c : contactsToInsert) {
                    Response r = new Response();
                    r.contactId = c.Id;
                    r.message = 'Contact "' + c.LastName + '" created successfully.';
                    responses.add(r);
                }
            } catch (DmlException e) {
                Response r = new Response();
                r.message = 'Failed to create contacts: ' + e.getMessage();
                responses.add(r);
            }
        }

        return responses;
    }
}