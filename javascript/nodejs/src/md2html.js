"use strict;"

import marked from "marked";

module.exports = (markdown, cliOptions) => {
  return marked.parse(markdown, {
    gfm: cliOptions.gfm
  });
};
