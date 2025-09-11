import { LightningElement } from 'lwc';

export default class Todi extends LightningElement {
    values;

 changehandler(event)
 {
    this.values=event.target.value;
 }
}