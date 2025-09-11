import { LightningElement, wire, track } from 'lwc';
import getPolicy from '@salesforce/apex/PolicyController.getPolicy';
import { NavigationMixin } from 'lightning/navigation';

const COLUMNS = [
    { label: 'Policy Name', fieldName: 'Name', type: 'text' },
    //{ label: 'Type', fieldName: 'Policy_Type__c', type: 'text' },
    //{ label: 'Coverage', fieldName: 'Coverage_Amount__c', type: 'currency' },
    //{ label: 'Premium', fieldName: 'Premium_Amount__c', type: 'currency' },
    //{ label: 'Duration (Months)', fieldName: 'Terms_Duration__c', type: 'number' },
    { label: 'Description', fieldName: 'Description__c', type: 'text' },
    {
        type: 'button',
        typeAttributes: {
            label: 'View',
            name: 'view',
            title: 'View Policy',
            variant: 'brand'
        }
    }
];

export default class PolicyDashboard extends LightningElement {
    @track policies;
    @track error;
    @track selectedRecordId;
    @track isModalOpen = false;

    columns = COLUMNS;

    @wire(getPolicy)
    wiredPolicies({ data, error }) {
        if (data) {
            this.policies = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.policies = undefined;
        }
    }

    handleRowAction(event) {
        const action = event.detail.action;
        const row = event.detail.row;

        if (action.name === 'view') {
            this.selectedRecordId = row.Id;
            this.isModalOpen = true;
        }
    }

    closeModal() {
        this.isModalOpen = false;
        this.selectedRecordId = null;
    }
}
