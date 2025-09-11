import { LightningElement } from 'lwc';

export default class Valuepass extends LightningElement {

    message='this is from the child component';
    handleclick()
    {
        const event=new CustomEvent('message',{detail:this.message});
        this.dispatchEvent(event);
    }
}