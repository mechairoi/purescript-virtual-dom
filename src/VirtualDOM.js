/* global exports, require */
"use strict";

// module VirtualDOM

exports.showPatchObjectImpl = JSON.stringify;

exports.createElement = require("virtual-dom/create-element");

var diff = require("virtual-dom/diff");

exports.diff = function (a) {
  return function (b) {
    return diff(a, b);
  };
};

var patch = require("virtual-dom/patch");

exports.patch = function (p) {
  return function (n) {
    return function () {
      return patch(n, p);
    };
  };
};
