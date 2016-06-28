"use strict";
require('jquery');
require('semantic-ui');
var platform_browser_dynamic_1 = require('@angular/platform-browser-dynamic');
var core_1 = require('@angular/core');
var _1 = require('./app/');
// import { AppComponent, environment, NameComponent } from './app/';
// import { PersonComponent } from './app/person/';
// import { HeaderComponent } from './app/header';
if (_1.environment.production) {
    core_1.enableProdMode();
}
platform_browser_dynamic_1.bootstrap(_1.AppComponent);
// bootstrap( NameComponent );
// bootstrap( PersonComponent );
// bootstrap( HeaderComponent ); 
//# sourceMappingURL=main.js.map