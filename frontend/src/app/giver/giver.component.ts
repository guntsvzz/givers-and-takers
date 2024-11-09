import { Component, OnInit } from '@angular/core';

interface Donator {
  name: string;
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
    { name: 'Todsavad Tangtortan', donates: 10, imageUrl: 'assets/todsavad.jpg' },
    { name: 'Chantiri Polprasert', donates: 5, imageUrl: 'assets/chantiri.jpg' },
    { name: 'Sunil Prajapati', donates: 3, imageUrl: 'assets/sunil.jpg' },
    { name: 'Tatiya Seehatrakul', donates: 2, imageUrl: 'assets/tatiya.jpg' },
    { name: 'Todsavad Tangtortan', donates: 10, imageUrl: 'assets/todsavad.jpg' },
    { name: 'Chantiri Polprasert', donates: 5, imageUrl: 'assets/chantiri.jpg' },
    { name: 'Sunil Prajapati', donates: 3, imageUrl: 'assets/sunil.jpg' },
    { name: 'Tatiya Seehatrakul', donates: 2, imageUrl: 'assets/tatiya.jpg' },
    { name: 'Todsavad Tangtortan', donates: 10, imageUrl: 'assets/todsavad.jpg' },
    { name: 'Chantiri Polprasert', donates: 5, imageUrl: 'assets/chantiri.jpg' },
    { name: 'Sunil Prajapati', donates: 3, imageUrl: 'assets/sunil.jpg' },
    { name: 'Tatiya Seehatrakul', donates: 2, imageUrl: 'assets/tatiya.jpg' }
  ];


  constructor() { }

  ngOnInit(): void { }
}
