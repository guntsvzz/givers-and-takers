import { Component } from '@angular/core';

@Component({
  selector: 'app-settings',
  templateUrl: './settings.component.html',
  styleUrls: ['./settings.component.scss']
})
export class SettingsComponent {
  selectedTab = 'account';

  user = {
    first_name: 'Todsavad',
    last_name: 'Tangtortan',
    email: 'st124859@gmail.com',
    password: '123456',
    phone_number: '0812345678',
    address: 'Pathum Thani',
    organization_name: 'AIT',
    organization_type: 'Non-profit',
  };

  fields = [
    { label: 'First Name', name: 'first_name', type: 'text', isEditing: false },
    { label: 'Last Name', name: 'last_name', type: 'text', isEditing: false },
    { label: 'Email', name: 'email', type: 'email', isEditing: false },
    { label: 'Password', name: 'password', type: 'password', isEditing: false },
    { label: 'Phone Number', name: 'phone_number', type: 'text', isEditing: false },
    { label: 'Address', name: 'address', type: 'text', isEditing: false },
    { label: 'Organization Name', name: 'organization_name', type: 'text', isEditing: false },
    { label: 'Organization Type', name: 'organization_type', type: 'text', isEditing: false }
  ];

  selectTab(tab: string) {
    this.selectedTab = tab;
  }

  toggleEdit(field: any) {
    if (field.isEditing) {
      // Save mode: disable editing and save changes
      field.isEditing = false;
      this.saveChanges();
    } else {
      // Edit mode: enable editing
      field.isEditing = true;
    }
  }

  saveChanges() {
    console.log('User settings saved:', this.user);
    // Add backend save logic here if needed
  }
}
