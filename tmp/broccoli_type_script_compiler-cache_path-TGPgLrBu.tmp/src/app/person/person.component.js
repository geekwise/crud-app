"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var core_1 = require('@angular/core');
var PersonComponent = (function () {
    function PersonComponent() {
        this.time = Date.now();
        this.article = {
            name: 'name of person',
            link: '#' + name
        },
            this.profiles = [{
                    name: 'mark',
                    link: '#' + name
                }, {
                    name: 'sue',
                    link: '#' + name
                }, {
                    name: 'bill',
                    link: '#' + name
                }];
    }
    ;
    PersonComponent.prototype.ngOnInit = function () {
    };
    PersonComponent = __decorate([
        core_1.Component({
            moduleId: module.id,
            selector: 'person-component',
            inputs: ['profile'],
            templateUrl: 'person.component.html',
            styleUrls: ['person.component.css']
        }), 
        __metadata('design:paramtypes', [])
    ], PersonComponent);
    return PersonComponent;
}());
exports.PersonComponent = PersonComponent;
//# sourceMappingURL=person.component.js.map