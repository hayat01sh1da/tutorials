"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.logPoint = void 0;
const logPoint = (p) => {
    return [p.x, p.y];
};
exports.logPoint = logPoint;
const point_1 = { x: 12, y: 26 };
logPoint(point_1);
const point_2 = { x: 12, y: 26, z: 89 };
logPoint(point_2);
const rect = { x: 33, y: 3, width: 30, height: 80 };
logPoint(rect);
//# sourceMappingURL=log_point.js.map