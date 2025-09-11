import { LightningElement,wire} from 'lwc';
import getContacts from '@salesforce/apex/accountcreate.getcontacts';
const columns = [
    { label: 'FistName', fieldName: 'FirstName' },
    { label: 'LastName', fieldName: 'LastName' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    { label: 'Email', fieldName: 'Email', type: 'Email' },
];
export default class ShowContacts extends LightningElement {
clom=columns;
data=[];
errors;
clickhandler(event)
{
    getContacts().then((data)=>{
        this.data=data;
    }).catch((error)=>{
        this.error=error;
    })
    
}
    
}