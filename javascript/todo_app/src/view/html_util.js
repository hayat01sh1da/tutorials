"use strict;"

const element = (strs, ...vals) => {
  const htmlStr = strs.reduce((result, str, i) => {
    const val = vals[i - 1];
    if (typeof val === "string") {
      return result + escapeSpecialChars(val) + str;
    } else {
      return result + String(val) + str;
    }
  });
  return html2Element(htmlStr);
};

const escapeSpecialChars = (str) => {
  return str
  .replace(/&/g, "&amp;")
  .replace(/</g, "&lt;")
  .replace(/>/g, "&gt;")
  .replace(/"/g, "&quot;")
  .replace(/'/g, "&#039;");
};

const html2Element = (html) => {
  const template = document.createElement("template");
  template.innerHTML = html;
  return template.content.firstElementChild;
};
const render = (bodyElement, containerElement) => {
  containerElement.innerHTML = "";
  containerElement.appendChild(bodyElement);
};

export {
  escapeSpecialChars,
  html2Element,
  element,
  render
};
