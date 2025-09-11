import { LightningElement } from 'lwc';

export default class ConditionalRendering extends LightningElement {
    isvisible=false;
    clickhandler()
    {
        this.isvisible=true;
    }
    myobject=[{
        fname:"pramod",
        lname:"limma",
        phone:"9178522236"
       
    },{
        fname:"prasad",
        lname:"limma",
        phone:"9178522289"
    },
{
        fname:"manini",
        lname:"chin",
        phone:"9178555289"
    }]
}