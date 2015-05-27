'use strict';

var Something = function (a, b) {
  this.a = a;
  this.b = b;
};

Something.prototype.multiply = function () {
  return this.a * this.b;
};

Something.prototype.sum = function () {
  return this.a + this.b;
};

Something.prototype.sayHello = function () {
  console.log('Hello there!');
};
