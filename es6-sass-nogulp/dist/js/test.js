"use strict";

var _importTest = require("./import-test");

var math = _interopRequireWildcard(_importTest);

function _interopRequireWildcard(obj) { if (obj && obj.__esModule) { return obj; } else { var newObj = {}; if (obj != null) { for (var key in obj) { if (Object.prototype.hasOwnProperty.call(obj, key)) newObj[key] = obj[key]; } } newObj.default = obj; return newObj; } }

console.log("2π=" + math.sum(math.pi, math.pi));