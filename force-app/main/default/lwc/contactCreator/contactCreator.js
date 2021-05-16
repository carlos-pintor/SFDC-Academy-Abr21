import { LightningElement } from 'lwc';
import createContact from '@salesforce/apex/CAPS_ContactHelper.createContact';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ContactCreator extends LightningElement {
    firstName = "";
    lastName = "";
    phoneNumber = "";
    emailAddress = "";
    companyName = "";

    handleChange(event) {
        const input = event.target;
        switch (input.name) {
            case "firstName":
                this.firstName = input.value;
                break;
            case "lastName":
                this.lastName = input.value;
                break;
            case "phoneNumber":
                this.phoneNumber = input.value;
                break;
            case "emailAddress":
                this.emailAddress = input.value;
                break;
            case "companyName":
                this.companyName = input.value;
                break;
            default:
                break;
        }
    }

    handleSave() {
        this.saveRecord();
    }

    handleCancel() {
        this.clearFields();
    }

    saveRecord() {
        console.log("saving record");
        const contactParams = {
            firstName: this.firstName,
            lastName: this.lastName,
            phoneNumber: this.phoneNumber,
            emailAddress: this.emailAddress,
            companyName: this.companyName
        };
        console.log("params:", contactParams);
        createContact({ params: contactParams})
        .then((result) => {
            console.log("success");
            this.showToast("success", "Saved successfuly", "");
            this.clearFields();
        })
        .catch((error) => {
            console.log("error", error);
            this.showToast("error", "Error", "Error on saveRecord");
        });
    }

    clearFields() {
        this.firstName = "";
        this.lastName = "";
        this.phoneNumber = "";
        this.emailAddress = "";
        this.companyName = "";
        this.template.querySelectorAll('lightning-input').forEach(element => {
            element.value = null;
        });
    }

    showToast(variant, title, message) {
        const event = new ShowToastEvent({
            variant: variant,
            title: title,
            message: message
        });
        this.dispatchEvent(event);
    }
}