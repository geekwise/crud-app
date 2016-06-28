"use strict";
var platform_browser_dynamic_1 = require('@angular/platform-browser-dynamic');
var core_1 = require('@angular/core');
var _1 = require('./app/');
var _2 = require('./app/person/');
if (_1.environment.production) {
    core_1.enableProdMode();
}
platform_browser_dynamic_1.bootstrap(_1.AppComponent);
platform_browser_dynamic_1.bootstrap(_1.NameComponent);
platform_browser_dynamic_1.bootstrap(_2.PersonComponent);
//# sourceMappingURL=main.js.map