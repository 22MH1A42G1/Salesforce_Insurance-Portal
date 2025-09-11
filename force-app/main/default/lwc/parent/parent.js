import { LightningElement } from 'lwc';

export default class Parent extends LightningElement {
    showmessage;
    handleevent(event)
    {
        this.showmessage=event.detail;
    }
}