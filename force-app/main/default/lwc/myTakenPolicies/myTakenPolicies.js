import { LightningElement } from 'lwc';
import getMyPolicies from '@salesforce/apex/CustomerPolicyController.getMyPolicies';

export default class CustomerPolicyTiles extends LightningElement {
  policies;
  error;
  isLoading = true;

  connectedCallback() {
    getMyPolicies()
      .then(data => {
        this.policies = data;
        this.isLoading = false;
      })
      .catch(error => {
        this.error = error.body.message || 'Unknown error';
        this.isLoading = false;
      });
  }
}
