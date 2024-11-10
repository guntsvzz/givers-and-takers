import { Component, OnInit } from '@angular/core';
import { TakerService } from '../services/taker.service';
interface Recipient {
  first_name: string;
  last_name : string;
  imageUrl: string;
  status: 'verified' | 'non-verified' | 'default';
}

@Component({
  selector: 'app-taker',
  templateUrl: './taker.component.html',
  styleUrls: ['./taker.component.scss']
})

export class TakerComponent implements OnInit {
  recipients: Recipient[] = [
    { first_name: 'Todsavad', last_name :'Tangtortan', imageUrl: 'assets/images/todsavad.jpg', status: 'verified' },
    { first_name: 'Chantiri', last_name :'Polprasert', imageUrl: 'assets/images/chantiri.jpg', status: 'non-verified' },
    { first_name: 'Sunil', last_name:'Prajapati', imageUrl: 'assets/images/sunil.jpg', status: 'verified' },
    { first_name: 'Tatiya', last_name:'Seehatrakul', imageUrl: 'assets/images/tatiya.jpg', status: 'default' }
  ];

  constructor(private takerService: TakerService) {}
  // constructor() { }

  getRecipientImageUrl(imageUrl: string | null | undefined): string {
    return imageUrl ? imageUrl : 'assets/organizer-avatar.png';
  }
  
  ngOnInit(): void {
    // Initialization logic can be placed here
    this.takerService.getTakers().subscribe((data) => {
      this.recipients = data;
    });
  }

  getStatusImage(status: 'verified' | 'non-verified' | 'default'): string {
    switch (status) {
      case 'verified':
        return 'assets/verified.png';
      case 'non-verified':
        return 'assets/non-verified.png';
      default:
        return 'assets/default-status.png'; // Default image if needed
    }
  }
}
