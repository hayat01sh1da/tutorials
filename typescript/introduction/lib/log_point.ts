interface Point {
  x: number;
  y: number;
}

const logPoint = (p: Point) => {
  return [p.x, p.y];
}

const point_1 = { x: 12, y: 26 };
logPoint(point_1);

const point_2 = { x: 12, y: 26, z: 89 };
logPoint(point_2);

const rect = { x: 33, y: 3, width: 30, height: 80 };
logPoint(rect);

export {
  logPoint
}
