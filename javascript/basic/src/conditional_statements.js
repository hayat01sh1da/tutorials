"use strinct";

// If statement

const getJavaScriptVersion1 = (version) => {
  if (version === "ES5") {
    return "ECMAScript 5";
  } else if (version === "ES6") {
    return "ECMAScript 2015";
  } else if (version === "ES7") {
    return "ECMAScript 2016";
  } else {
    return "Input a version of a specific JavaScript version.";
  }
};

const getJavaScriptVersion2 = (version) => {
  switch (version) {
    case "ES5":
      return "ECMAScript 5";
    case "ES6":
      return "ECMAScript 2015";
    case "ES7":
      return "ECMAScript 2016";
    default:
      return "Input a version of a specific JavaScript version.";
  };
};

export {
  getJavaScriptVersion1,
  getJavaScriptVersion2
};
