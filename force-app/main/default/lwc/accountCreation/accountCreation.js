import { LightningElement } from 'lwc';
import accountcreation from "@salesforce/apex/accountcreate.accountcreation";
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class AccountCreation extends NavigationMixin(LightningElement) {
    fname;
    phone;
    emails;

    changehandler(event) {
        let { name, value } = event.target;
        if (name === "fname") this.fname = value;
        if (name === "phone") this.phone = value;
        if (name === "emails") this.emails = value;
    }

    clickhandler() {
        accountcreation({
            names: this.fname,
            phonenumber: this.phone,
            emails: this.emails
        })
        .then((recordId) => {
            this.showToast('Success', 'Account has been created successfully', 'success');

            // Clear inputs
            this.template.querySelectorAll('lightning-input').forEach(input => {
                input.value = '';
            });

            // Navigate to the created record
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: recordId,
                    objectApiName: 'Account',
                    actionName: 'view'
                }
            });
        })
        .catch((error) => {
            this.showToast('Error', error.body.message, 'error');
        });
    }

    showToast(title, message, variant) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: title,
                message: message,
                variant: variant
            })
        );
    }
}
