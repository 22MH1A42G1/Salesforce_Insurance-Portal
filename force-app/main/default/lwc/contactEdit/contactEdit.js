import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreateContactLDS extends LightningElement {
    
    handleSuccess(event) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success!',
                message: 'Contact record created with Id: ' + event.detail.id,
                variant: 'success',
            })
        );
        this.clearFields();
    }

    handleSubmit(event) {
        console.log('Form Submitted');
    }

    clearFields() {
        const inputFields = this.template.querySelectorAll('lightning-input-field');
        inputFields.forEach(field => {
            field.reset(); // LDS way to clear fields
        });
    }
}
