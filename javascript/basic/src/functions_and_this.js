"user strict;"

const getGreetingMessage = (userName) => {
  const user = {
    name: userName,
    greet() {
      return `Hi, I'm ${this.name}. Nice to see you!`;
    }
  }
  return user.greet();
};

function greet(msg) {
  return `Hi, I'm ${this.name}. ${msg}`;
};

const userTitle1 = {
  title: "Mr.",
  addTitle(users) {
    return users.map(function(user) {
      return `${this.title} ${user}`;
    }, this)
  }
};

const userTitle2 = {
  title: "Mr.",
  addTitle(users) {
    return users.map((user) => {
      return `${this.title} ${user}`;
    })
  }
};

export {
  getGreetingMessage,
  greet,
  userTitle1,
  userTitle2
};
