"use strict;"

import calculateWinner from "../calculate_winner";

const EMPTY_BOARD = Array(9).fill(null);

const boardOf = (marks) => {
  const squares = EMPTY_BOARD.slice();
  Object.entries(marks).forEach(([index, mark]) => {
    squares[Number(index)] = mark;
  });
  return squares;
};

describe("calculateWinner", () => {
  test("returns null for an empty board", () => {
    expect(calculateWinner(EMPTY_BOARD)).toBeNull();
  });

  test("returns null while the game is still undecided", () => {
    expect(calculateWinner(boardOf({ 0: "X", 4: "O", 8: "X" }))).toBeNull();
  });

  test("returns null for a drawn board", () => {
    // X O X
    // X O O
    // O X X
    const draw = ["X", "O", "X", "X", "O", "O", "O", "X", "X"];
    expect(calculateWinner(draw)).toBeNull();
  });

  describe("detects every winning line", () => {
    const lines = {
      "top row": [0, 1, 2],
      "middle row": [3, 4, 5],
      "bottom row": [6, 7, 8],
      "left column": [0, 3, 6],
      "middle column": [1, 4, 7],
      "right column": [2, 5, 8],
      "descending diagonal": [0, 4, 8],
      "ascending diagonal": [2, 4, 6]
    };

    Object.entries(lines).forEach(([name, [a, b, c]]) => {
      test(`X wins on the ${name}`, () => {
        expect(calculateWinner(boardOf({ [a]: "X", [b]: "X", [c]: "X" }))).toBe("X");
      });

      test(`O wins on the ${name}`, () => {
        expect(calculateWinner(boardOf({ [a]: "O", [b]: "O", [c]: "O" }))).toBe("O");
      });
    });
  });

  test("does not treat a mixed line as a win", () => {
    expect(calculateWinner(boardOf({ 0: "X", 1: "O", 2: "X" }))).toBeNull();
  });

  test("returns the first winning line when several are complete", () => {
    // X wins on the top row and on the left column at the same time.
    expect(calculateWinner(boardOf({ 0: "X", 1: "X", 2: "X", 3: "X", 6: "X" }))).toBe("X");
  });
});
