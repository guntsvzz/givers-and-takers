import { Component } from '@angular/core';

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.scss']
})
export class FooterComponent {

  changeLanguage(event: Event) {
    const selectedLanguage = (event.target as HTMLSelectElement).value;
    // Implement your language change logic here
    // For example, using ngx-translate:
    // this.translateService.use(selectedLanguage);

    console.log('Language changed to:', selectedLanguage); // Log the selected language
  }
}
