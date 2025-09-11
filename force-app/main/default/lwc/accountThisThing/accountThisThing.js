import { LightningElement } from 'lwc';
import ACCOUNT_NAME from '@salesforce/schema/Account.Name';
import ACCOUNT_PHONE from '@salesforce/schema/Account.Phone';
import ACCOUNT_WEBSITE from '@salesforce/schema/Account.Website';

export default class AccountCreator extends LightningElement {
    fields = [ACCOUNT_NAME, ACCOUNT_PHONE];

    handleSuccess(event) {
        alert('Account created with Id: ' + event.detail.id);
    }
}
