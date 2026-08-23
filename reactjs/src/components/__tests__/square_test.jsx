"use strict;"

import { render, screen } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import Square from "../square";

describe("Square", () => {
  test("renders the given value inside a button", () => {
    render(<Square value="X" onClick={() => {}} />);
    const button = screen.getByRole("button");
    expect(button).toHaveTextContent("X");
    expect(button).toHaveClass("square");
  });

  test("renders an empty button when the value is null", () => {
    render(<Square value={null} onClick={() => {}} />);
    expect(screen.getByRole("button")).toHaveTextContent("");
  });

  test("invokes onClick once per click", async () => {
    const user = userEvent.setup();
    const onClick = jest.fn();
    render(<Square value={null} onClick={onClick} />);
    await user.click(screen.getByRole("button"));
    await user.click(screen.getByRole("button"));
    expect(onClick).toHaveBeenCalledTimes(2);
  });
});
