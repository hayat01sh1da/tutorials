"use strict;"

import assert from "assert";
import fs from "fs";
import path from "path";
import md2html from "../src/md2html";

it("converts Markdown to HTML (GFM=true)", () => {
  const sample   = fs.readFileSync(path.resolve(__dirname, "./fixtures/sample.md"), { encoding: "utf8" });
  const expected = fs.readFileSync(path.resolve(__dirname, "./fixtures/expected_gfm.html"), { encoding: "utf8" });
  assert.strictEqual(md2html(sample, { gfm: true }).trimEnd(), expected.trimEnd());
});

it("converts Markdown to HTML (GFM=false)", () => {
  const sample   = fs.readFileSync(path.resolve(__dirname, "./fixtures/sample.md"), { encoding: "utf8" });
  const expected = fs.readFileSync(path.resolve(__dirname, "./fixtures/expected.html"), { encoding: "utf8" });
  assert.strictEqual(md2html(sample, { gfm: false }).trimEnd(), expected.trimEnd());
});
