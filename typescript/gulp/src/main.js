"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.greetFromCompiler = void 0;
const greetings_1 = require("./greetings");
const greetFromCompiler = (greeting, compiler) => {
    return `${greeting} from ${compiler}!!`;
};
exports.greetFromCompiler = greetFromCompiler;
const showGreeting = (divID, message) => {
    const elem = document.getElementById(divID);
    if (elem !== null) {
        elem.innerText = message;
    }
};
const divID = "greeting";
const greeting = (0, greetings_1.greet)(1);
const compiler = "TypeScript";
const message = greetFromCompiler(greeting, compiler);
showGreeting(divID, message);
//# sourceMappingURL=main.js.map