import { Component, OnInit } from '@angular/core';
import { GiverService } from '../services/giver.service';

interface Donator {
  first_name: string;
  last_name : string;
  donates: number;
  imageUrl: string; // New property for the image URL
}

@Component({
  selector: 'app-giver',
  templateUrl: './giver.component.html',
  styleUrls: ['./giver.component.scss']
})
export class GiverComponent implements OnInit {
  // Check this example TypeScript component data
  public donators: Donator[] = [
    { first_name: 'Todsavad', last_name :' Tangtortan', donates: 10, imageUrl: 'assets/todsavad.jpg' },
    { first_name: 'Chantiri', last_name :' Polprasert', donates: 5, imageUrl: 'assets/chantiri.jpg' },
    { first_name: 'Sunil', last_name :' Prajapati', donates: 3, imageUrl: 'assets/sunil.jpg' },
    { first_name: 'Tatiya', last_name :' Seehatrakul', donates: 2, imageUrl: 'assets/tatiya.jpg' },
    { first_name: 'Todsavad', last_name :' Tangtortan', donates: 10, imageUrl: 'assets/todsavad.jpg' },
    { first_name: 'Chantiri', last_name :' Polprasert', donates: 5, imageUrl: 'assets/chantiri.jpg' },
    { first_name: 'Sunil', last_name :' Prajapati', donates: 3, imageUrl: 'assets/sunil.jpg' },
    { first_name: 'Tatiya', last_name :' Seehatrakul', donates: 2, imageUrl: 'assets/tatiya.jpg' },
    { first_name: 'Todsavad', last_name :' Tangtortan', donates: 10, imageUrl: 'assets/todsavad.jpg' },
    { first_name: 'Chantiri', last_name :' Polprasert', donates: 5, imageUrl: 'assets/chantiri.jpg' },
    { first_name: 'Sunil', last_name :' Prajapati', donates: 3, imageUrl: 'assets/sunil.jpg' },
    { first_name: 'Tatiya', last_name :' Seehatrakul', donates: 2, imageUrl: 'assets/tatiya.jpg' }
  ];

  constructor(private giverService: GiverService) {}
  // constructor() { }

  getDonatorImageUrl(imageUrl: string | null | undefined): string {
    return imageUrl ? imageUrl : 'assets/organizer-avatar.png';
  }
  
  ngOnInit(): void {
    // Initialization logic can be placed here
    this.giverService.getTakers().subscribe((data) => {
      this.donators = data;
    });
  }
}
