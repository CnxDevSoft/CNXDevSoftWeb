import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-main-page',
  templateUrl: './main-page.component.html',
  styleUrls: ['./main-page.component.sass']
})
export class MainPageComponent implements OnInit {
  features = [
    {
      id: 1,
      name: 'Future technology',
      description: 'We are implement and develop software with new technology base on .NET plateform.',
      image: 'fas fa-eye'
    },
    {
      id: 2,
      name: 'Extraordinary product',
      description: 'Code quality can have a major impact on software quality, on the productivity of software teams, and their ability to collaborate.',
      image: 'fas fa-bag'
    },
    {
      id: 3,
      name: 'Fast deliver',
      description: 'Auto Delivery and intelligent system by Power Devops team.',
      image: 'fas fa-shipping-fast'
    },
    {
      id: 4,
      name: 'Heart support',
      description: 'We already to support our clients and customers 24/7.',
      image: 'fas fa-heart'
    }
  ];

  constructor() { }

  ngOnInit() {
  }
}
