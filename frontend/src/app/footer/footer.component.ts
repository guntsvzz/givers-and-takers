import { Component } from '@angular/core';

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.scss']
})
export class FooterComponent {

  toggleLanguage() {
    // Here you can implement logic to change language.
    // For example, switching language in ngx-translate:
    // this.translateService.use(newLanguageCode);

    alert('Language toggled!'); // Placeholder for actual language change functionality
  }
}
