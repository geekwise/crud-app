import 'jquery';
import 'semantic-ui';

import { bootstrap } from '@angular/platform-browser-dynamic';
import { enableProdMode } from '@angular/core';
import { AppComponent, environment} from './app/';
// import { AppComponent, environment, NameComponent } from './app/';
// import { PersonComponent } from './app/person/';
// import { HeaderComponent } from './app/header';

if (environment.production) {
  enableProdMode();
}

bootstrap( AppComponent );
// bootstrap( NameComponent );
// bootstrap( PersonComponent );
// bootstrap( HeaderComponent );