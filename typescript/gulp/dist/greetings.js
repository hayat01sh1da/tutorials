"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.greet = void 0;
const greet = (index) => {
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
exports.greet = greet;
