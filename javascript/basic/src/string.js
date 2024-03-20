"use strict;"

const removeDuplicateSpace = (str) => {
  return str.split(/\s+/).join(" ");
};

const getBaseURL = (url) => {
  const qurtyIndex = url.indexOf("?");
  const host = url.slice(0, qurtyIndex)
  return host;
}

const getURLQueryString = (url) => {
  const qurtyIndex = url.indexOf("?");
  const querystr = url.slice(qurtyIndex + 1)
  return querystr;
}

// Regular expression
const getIndexInSearch = (text, pattern) => {
  const index = text.search(pattern);
  return index;
};

const getIndexInMatch = (text, pattern) => {
  const result = text.match(pattern);
  return result;
};

const getIndexInMatchAll = (text, pattern) => {
  const info = [];
  const results = text.matchAll(pattern);
  for (const result of results) {
    info.push(`"${result[0]}", ${result[1]}, index: ${result.index}, input: "${result.input}", groups: ${result.groups}`);
  };
  return info;
};

const convertToEnDate = (_, year, month, day) => {
  let enMonth = "";
  switch (month) {
    case "01":
      enMonth = "Jan";
      break;
    case "02":
      enMonth = "Feb";
      break;
    case "03":
      enMonth = "Mar";
      break;
    case "04":
      enMonth = "Apr";
      break;
    case "05":
      enMonth = "May";
      break;
    case "06":
      enMonth = "Jun";
      break;
    case "07":
      enMonth = "Jul";
      break;
    case "08":
      enMonth = "Aug";
      break;
    case "09":
      enMonth = "Sep";
      break;
    case "10":
      enMonth = "Oct";
      break;
    case "11":
      enMonth = "Nov";
      break;
    case "12":
      enMonth = "Dec";
      break;
    default:
      enMonth = "Unknown";
  };
  const enDate = `${day} ${enMonth} ${year}`;
  return enDate;
};

const replaceString = (text, pattern, altChar) => {
  const newText = text.replace(pattern, altChar);
  return newText;
};

export {
  removeDuplicateSpace,
  getBaseURL,
  getURLQueryString,
  getIndexInSearch,
  getIndexInMatch,
  getIndexInMatchAll,
  convertToEnDate,
  replaceString
};
