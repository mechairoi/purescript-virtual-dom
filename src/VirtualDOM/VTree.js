/* global exports, require */
"use strict";

// module VirtualDOM.VTree

exports.showVTreeImpl = JSON.stringify;

exports.vnode = function () {
  var VNode = require("virtual-dom/vnode/vnode");

  return function (name) {
    return function (props) {
      return function (children) {
        var key, ns;

        if (props.namespace) {
          ns = props.namespace;
          props.namespace = undefined;
        }

        if (props.key) {
          key = props.key;
          props.key = undefined;
        }

        return new VNode(name, props, children, key, ns);
      };
    };
  };
}();

exports.vtext = function () {
  var VText = require("virtual-dom/vnode/vtext");
  return function (text) {
    return new VText(text);
  };
}();

exports.widget = function () {
  return function (props) {
    var rWidget = { type: "Widget" };

    if (props.init)    { rWidget.init    = props.init; }
    if (props.update)  { rWidget.update  = props.update; }
    if (props.destroy) { rWidget.destroy = props.destroy; }

    return rWidget;
  };
}();

exports.thunk_ = function () {
  return function (renderFn) {
    return function (nothing) {
      return function (just) {
        var rThunk = {
          type: "Thunk",
          render: function (prevNode) {
            if (prevNode === null)
              return renderFn(nothing);
            else
              return renderFn(just(prevNode));
          }
        };
        // No need for vnode here.  It is used internally by virtual-dom to cache
        // the result of render.
        return rThunk;
      };
    };
  };
}();

exports.vhook = function () {
  return function (props) {
    var RVHook  = function () { };
    if (props.hook)   { RVHook.prototype.hook    = props.hook; }
    if (props.unhook) { RVHook.prototype.unhook  = props.unhook; }
    return new RVHook();
  };
}();

exports.showVHookImpl = JSON.stringify;
