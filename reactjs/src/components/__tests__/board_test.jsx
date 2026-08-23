"use strict;"

import { render, screen } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import Board from "../board";

const squaresOf = (values) => {
  const squares = Array(9).fill(null);
  Object.entries(values).forEach(([index, value]) => {
    squares[Number(index)] = value;
  });
  return squares;
};

describe("Board", () => {
  test("renders nine squares", () => {
    render(<Board squares={Array(9).fill(null)} onClick={() => {}} />);
    expect(screen.getAllByRole("button")).toHaveLength(9);
  });

  test("renders the squares in three rows of three", () => {
    const { container } = render(<Board squares={Array(9).fill(null)} onClick={() => {}} />);
    const rows = container.querySelectorAll(".board-row");
    expect(rows).toHaveLength(3);
    rows.forEach((row) => {
      expect(row.querySelectorAll("button.square")).toHaveLength(3);
    });
  });

  test("renders each square with the value at its own index", () => {
    render(<Board squares={squaresOf({ 0: "X", 4: "O", 8: "X" })} onClick={() => {}} />);
    const buttons = screen.getAllByRole("button");
    expect(buttons.map((button) => button.textContent)).toStrictEqual([
      "X", "", "", "", "O", "", "", "", "X"
    ]);
  });

  test("passes the clicked index up to onClick", async () => {
    const user = userEvent.setup();
    const onClick = jest.fn();
    render(<Board squares={Array(9).fill(null)} onClick={onClick} />);
    const buttons = screen.getAllByRole("button");
    await user.click(buttons[0]);
    await user.click(buttons[5]);
    await user.click(buttons[8]);
    expect(onClick.mock.calls).toStrictEqual([[0], [5], [8]]);
  });
});
