import { Component, OnInit } from '@angular/core';

interface Recipient {
  name: string;
  imageUrl: string;
  status: 'verified' | 'non-verified';
}

@Component({
  selector: 'app-taker',
  templateUrl: './taker.component.html',
  styleUrls: ['./taker.component.scss']
})
export class TakerComponent implements OnInit {
  recipients: Recipient[] = [
    { name: 'Todsavad Tangtortan', imageUrl: 'assets/images/todsavad.jpg', status: 'verified' },
    { name: 'Chantiri Polprasert', imageUrl: 'assets/images/chantiri.jpg', status: 'non-verified' },
    { name: 'Sunil Prajapati', imageUrl: 'assets/images/sunil.jpg', status: 'verified' },
    { name: 'Tatiya Seehatrakul', imageUrl: 'assets/images/tatiya.jpg', status: 'non-verified' }
  ];

  constructor() { }

  ngOnInit(): void {
    // Initialization logic can be placed here
  }

  getStatusImage(status: string): string {
    switch (status) {
      case 'verified':
        return 'assets/verified.png';
      case 'non-verified':
        return 'assets/non-verified.png';
      default:
        return 'assets/default-status.png'; // optional: a default image if needed
    }
  }
  
}

