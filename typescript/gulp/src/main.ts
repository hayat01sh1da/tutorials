import {
  greet
} from "./greetings";

const greetFromCompiler = (greeting: string, compiler: string) => {
  return `${greeting} from ${compiler}!!`;
};

const showGreeting = (divID: string, message: string) => {
  const elem = document.getElementById(divID);
  if(elem !== null) {
    elem.innerText = message;
  };
};

const divID = "greeting";
const greeting = greet(1);
const compiler = "TypeScript";
const message = greetFromCompiler(greeting, compiler);
showGreeting(divID, message);

export {
  greetFromCompiler
};
