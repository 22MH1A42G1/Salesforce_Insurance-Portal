import { LightningElement, api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class RedirectRecordpage extends NavigationMixin(LightningElement) {
    @api recordId;

    connectedCallback() {
        if (this.recordId) {
            console.log('Navigating to:', this.recordId); // Optional for debug
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: this.recordId,
                    objectApiName: 'Customer__c', // Ensure correct object API name
                    actionName: 'view'
                }
            });
        }
    }
}
