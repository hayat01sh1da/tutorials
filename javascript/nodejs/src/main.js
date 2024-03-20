"use strict;"

import program from "commander";;
import fs from "fs";;
import md2html from "./md2html";

const getFilePath = () => {
  program.option("--gfm", "Enable gfm");
  program.parse(process.argv);
  const options = program.opts();
  const filePath = program.args[0];
  return filePath;
};

const cliOptions = {
    gfm: false,
    ...program.opts(),
};

const syncMarkdownToHTML = () => {
  try {
    const file = fs.readFileSync(getFilePath(), { encoding: "utf8" });
    const html = marked(file, { gfm: cliOptions.gfm });
    console.log(html);
  } catch (error) {
    console.error(error);
  }
};

const asyncMarkdownToHTML = () => {
  fs.readFile(getFilePath(), { encoding: "utf8" }, (err, file) => {
    if (err) {
      console.error(error);
      process.exit(1);
      return;
    } else {
      const html = md2html(file, cliOptions);
      console.log(html);
    }
  });
};

asyncMarkdownToHTML();
