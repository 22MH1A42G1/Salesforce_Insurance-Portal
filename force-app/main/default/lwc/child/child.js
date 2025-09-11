import { LightningElement } from 'lwc';

export default class Child extends LightningElement {

    message='this is from the child component';
    handleClick()
    {
        const event=new CustomEvent('findit',{detail:this.message});
        this.dispatchEvent(event);
    }
}