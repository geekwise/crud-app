import { Component, OnInit } from '@angular/core';

@Component({
  moduleId: module.id,
  selector: 'person-component',
  inputs: ['profile'],
  templateUrl: 'person.component.html',
  styleUrls: ['person.component.css']
})

export class PersonComponent implements OnInit {
  time = Date.now();
  
  profiles : Object[];
  article : Object;
  
  
  constructor() {
    
    this.article = {
        name : 'name of person',
        link : '#' + name
    },
    
    
    
    this.profiles = [{
          name : 'mark'
        }, {
          name : 'sue'
        }, {
          name : 'bill'
        }]
    
    
  };

  
  
  ngOnInit() {
  }

}
