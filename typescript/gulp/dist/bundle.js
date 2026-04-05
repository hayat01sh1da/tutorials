"use strict";
(() => {
  // src/greetings.ts
  var greet = (index) => {
    const greetings = [
      "Good morning",
      "Hello",
      "Hi",
      "Good evening",
      "Good night",
      "See you"
    ];
    if (index >= greetings.length) {
      return "The index you assign is out of range.";
    }
    return greetings[index];
  };

  // src/main.ts
  var greetFromCompiler = (greeting2, compiler2) => {
    return `${greeting2} from ${compiler2}!!`;
  };
  var showGreeting = (divID2, message2) => {
    const elem = document.getElementById(divID2);
    if (elem !== null) {
      elem.innerText = message2;
    }
    ;
  };
  var divID = "greeting";
  var greeting = greet(1);
  var compiler = "TypeScript";
  var message = greetFromCompiler(greeting, compiler);
  showGreeting(divID, message);
})();
//# sourceMappingURL=bundle.js.map
