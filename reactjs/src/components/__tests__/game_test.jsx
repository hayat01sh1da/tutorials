"use strict;"

import { render, within } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import Game from "../game";

const renderGame = () => {
  const user = userEvent.setup();
  const { container } = render(<Game />);
  const squares = () => within(container.querySelector(".game-board")).getAllByRole("button");
  const moves = () => within(container.querySelector(".game-info")).getAllByRole("button");
  const status = () => container.querySelector(".game-info > div").textContent;
  const play = async (...indexes) => {
    for (const index of indexes) {
      await user.click(squares()[index]);
    }
  };
  return { user, container, squares, moves, status, play };
};

describe("Game", () => {
  test("starts with an empty board and X to move", () => {
    const { squares, status } = renderGame();
    expect(squares()).toHaveLength(9);
    expect(squares().every((square) => square.textContent === "")).toBe(true);
    expect(status()).toBe("Next player: X");
  });

  test("starts with a single move-list entry pointing at the game start", () => {
    const { moves } = renderGame();
    expect(moves()).toHaveLength(1);
    expect(moves()[0]).toHaveTextContent("Go to game start");
  });

  test("marks the clicked square and alternates the player", async () => {
    const { squares, status, play } = renderGame();
    await play(0);
    expect(squares()[0]).toHaveTextContent("X");
    expect(status()).toBe("Next player: O");

    await play(4);
    expect(squares()[4]).toHaveTextContent("O");
    expect(status()).toBe("Next player: X");
  });

  test("ignores a click on an already-filled square", async () => {
    const { squares, status, play } = renderGame();
    await play(0, 0);
    expect(squares()[0]).toHaveTextContent("X");
    expect(status()).toBe("Next player: O");
  });

  test("appends one move-list entry per move", async () => {
    const { moves, play } = renderGame();
    await play(0, 4, 1);
    expect(moves().map((move) => move.textContent)).toStrictEqual([
      "Go to game start",
      "Go to move #1",
      "Go to move #2",
      "Go to move #3"
    ]);
  });

  test("announces the winner once a line is complete", async () => {
    const { status, play } = renderGame();
    // X: 0, 1, 2 / O: 3, 4
    await play(0, 3, 1, 4, 2);
    expect(status()).toBe("Winner: X");
  });

  test("freezes the board after a win", async () => {
    const { squares, status, moves, play } = renderGame();
    await play(0, 3, 1, 4, 2);
    const movesAfterWin = moves().length;

    await play(5);
    expect(squares()[5]).toHaveTextContent("");
    expect(status()).toBe("Winner: X");
    expect(moves()).toHaveLength(movesAfterWin);
  });

  test("jumps back to an earlier board without discarding the history", async () => {
    const { user, squares, status, moves, play } = renderGame();
    await play(0, 4, 8);
    expect(moves()).toHaveLength(4);

    await user.click(moves()[1]); // Go to move #1
    expect(squares().map((square) => square.textContent)).toStrictEqual([
      "X", "", "", "", "", "", "", "", ""
    ]);
    expect(status()).toBe("Next player: O");
    expect(moves()).toHaveLength(4);
  });

  test("restores X as the next player when jumping to the game start", async () => {
    const { user, squares, status, moves, play } = renderGame();
    await play(0, 4);

    await user.click(moves()[0]); // Go to game start
    expect(squares().every((square) => square.textContent === "")).toBe(true);
    expect(status()).toBe("Next player: X");
  });

  test("discards the abandoned future when a move is played after a jump", async () => {
    const { user, squares, moves, play } = renderGame();
    await play(0, 4, 8);

    await user.click(moves()[1]); // Go to move #1
    await play(1); // O takes a different square

    expect(moves().map((move) => move.textContent)).toStrictEqual([
      "Go to game start",
      "Go to move #1",
      "Go to move #2"
    ]);
    expect(squares().map((square) => square.textContent)).toStrictEqual([
      "X", "O", "", "", "", "", "", "", ""
    ]);
  });

  test("leaves the board playable when it is full without a winner", async () => {
    const { status, squares, play } = renderGame();
    // X O X
    // X O O
    // O X X
    await play(0, 1, 2, 4, 3, 5, 7, 6, 8);
    expect(squares().map((square) => square.textContent)).toStrictEqual([
      "X", "O", "X", "X", "O", "O", "O", "X", "X"
    ]);
    expect(status()).toBe("Next player: O");
  });
});
