"use strict;"

const getElementContent = (elem) => {
  const head_1 = document.querySelector(elem);
  const headText = head_1.textContent;
  return headText;
};

const createButton = (elem, buttonText) => {
  const button = document.createElement(elem);
  button.textContent = buttonText;
  document.body.appendChild(button);
};

const main = async () => {
  try {
    const userID = getUserID("userID");
    const userInfo = await fetchUserInfo(userID);
    const view = createView(userInfo);
    displayView(view);
  } catch (error) {
    console.error(`Error raised: ${error}`);
  }
};

const getUserID = (id) => {
  return document.getElementById(id).value;
};

const fetchUserInfo = (userID) => {
  return fetch(`https://api.github.com/users/${encodeURIComponent(userID)}`).then(getResponse);
};

const getResponse = (res) => {
  if (!res.ok) {
    return Promise.reject(new Error(`${res.status}: ${res.statusText}`));
  } else {
    return res.json();
  }
};

const createView = (userInfo) => {
  const view = escapeHTML`
    <h3>${userInfo.name}(@${userInfo.login})</h3>
    <img src="${userInfo.avatar_url}" alt="${userInfo.login}" height=100>
    <dl>
      <dt>Location</dt>
      <dd>${userInfo.location}</dd>
      <dt>Repositories</dt>
      <dd>${userInfo.public_repos}</dd>
    </dl>
  `;
  return view;
};

const displayView = (view) => {
  const result = document.getElementById("result");
  result.innerHTML = view;
};

const escapeHTML = (strs, ...vals) => {
  return strs.reduce((result, str, i) => {
    const val = vals[i -1];
    if (typeof val === "string") {
      return result + escapeSpecialChars(val) + str;
    } else {
      return result + String(val) + str;
    }
  });
};

const escapeSpecialChars = (str) => {
  return str
  .replace(/&/g, "&amp;")
  .replace(/</g, "&lt;")
  .replace(/>/g, "&gt;")
  .replace(/"/g, "&quot;")
  .replace(/'/g, "&#039;");
};
