import { LightningElement } from 'lwc';

export default class Getvalue extends LightningElement {

         message;
         handlemessage(event)
         {
            this.message=event.detail;
         }
}