(function(){function r(e,n,t){function o(i,f){if(!n[i]){if(!e[i]){var c="function"==typeof require&&require;if(!f&&c)return c(i,!0);if(u)return u(i,!0);var a=new Error("Cannot find module '"+i+"'");throw a.code="MODULE_NOT_FOUND",a}var p=n[i]={exports:{}};e[i][0].call(p.exports,function(r){var n=e[i][1][r];return o(n||r)},p,p.exports,r,e,n,t)}return n[i].exports}for(var u="function"==typeof require&&require,i=0;i<t.length;i++)o(t[i]);return o}return r})()({1:[function(require,module,exports){
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

},{}],2:[function(require,module,exports){
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
    elem.innerText = message;
};
const divID = "greeting";
const greeting = greetings_1.greet(1);
const compiler = "TyepScript";
const message = greetFromCompiler(greeting, compiler);
showGreeting(divID, message);

},{"./greetings":1}]},{},[2])
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi4uL25vZGVfbW9kdWxlcy9icm93c2VyLXBhY2svX3ByZWx1ZGUuanMiLCJzcmMvZ3JlZXRpbmdzLnRzIiwic3JjL21haW4udHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFBQUE7Ozs7QUNBQSxNQUFNLEtBQUssR0FBRyxDQUFDLEtBQWEsRUFBRSxFQUFFO0lBQzlCLE1BQU0sU0FBUyxHQUFHO1FBQ2hCLGNBQWM7UUFDZCxPQUFPO1FBQ1AsSUFBSTtRQUNKLGNBQWM7UUFDZCxZQUFZO1FBQ1osU0FBUztLQUNWLENBQUM7SUFDRixJQUFJLEtBQUssSUFBSSxTQUFTLENBQUMsTUFBTSxFQUFFO1FBQzdCLE9BQU8sdUNBQXVDLENBQUE7S0FDL0M7SUFDRCxPQUFPLFNBQVMsQ0FBQyxLQUFLLENBQUMsQ0FBQztBQUMxQixDQUFDLENBQUM7QUFHQSxzQkFBSzs7Ozs7O0FDaEJQLDJDQUVxQjtBQUVyQixNQUFNLGlCQUFpQixHQUFHLENBQUMsUUFBZ0IsRUFBRSxRQUFnQixFQUFFLEVBQUU7SUFDL0QsT0FBTyxHQUFHLFFBQVEsU0FBUyxRQUFRLElBQUksQ0FBQztBQUMxQyxDQUFDLENBQUM7QUFjQSw4Q0FBaUI7QUFabkIsTUFBTSxZQUFZLEdBQUcsQ0FBQyxLQUFhLEVBQUUsT0FBZSxFQUFFLEVBQUU7SUFDdEQsTUFBTSxJQUFJLEdBQUcsUUFBUSxDQUFDLGNBQWMsQ0FBQyxLQUFLLENBQUMsQ0FBQztJQUM1QyxJQUFJLENBQUMsU0FBUyxHQUFHLE9BQU8sQ0FBQztBQUMzQixDQUFDLENBQUM7QUFFRixNQUFNLEtBQUssR0FBRyxVQUFVLENBQUM7QUFDekIsTUFBTSxRQUFRLEdBQUcsaUJBQUssQ0FBQyxDQUFDLENBQUMsQ0FBQztBQUMxQixNQUFNLFFBQVEsR0FBRyxZQUFZLENBQUM7QUFDOUIsTUFBTSxPQUFPLEdBQUcsaUJBQWlCLENBQUMsUUFBUSxFQUFFLFFBQVEsQ0FBQyxDQUFDO0FBQ3RELFlBQVksQ0FBQyxLQUFLLEVBQUUsT0FBTyxDQUFDLENBQUMiLCJmaWxlIjoiZ2VuZXJhdGVkLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXNDb250ZW50IjpbIihmdW5jdGlvbigpe2Z1bmN0aW9uIHIoZSxuLHQpe2Z1bmN0aW9uIG8oaSxmKXtpZighbltpXSl7aWYoIWVbaV0pe3ZhciBjPVwiZnVuY3Rpb25cIj09dHlwZW9mIHJlcXVpcmUmJnJlcXVpcmU7aWYoIWYmJmMpcmV0dXJuIGMoaSwhMCk7aWYodSlyZXR1cm4gdShpLCEwKTt2YXIgYT1uZXcgRXJyb3IoXCJDYW5ub3QgZmluZCBtb2R1bGUgJ1wiK2krXCInXCIpO3Rocm93IGEuY29kZT1cIk1PRFVMRV9OT1RfRk9VTkRcIixhfXZhciBwPW5baV09e2V4cG9ydHM6e319O2VbaV1bMF0uY2FsbChwLmV4cG9ydHMsZnVuY3Rpb24ocil7dmFyIG49ZVtpXVsxXVtyXTtyZXR1cm4gbyhufHxyKX0scCxwLmV4cG9ydHMscixlLG4sdCl9cmV0dXJuIG5baV0uZXhwb3J0c31mb3IodmFyIHU9XCJmdW5jdGlvblwiPT10eXBlb2YgcmVxdWlyZSYmcmVxdWlyZSxpPTA7aTx0Lmxlbmd0aDtpKyspbyh0W2ldKTtyZXR1cm4gb31yZXR1cm4gcn0pKCkiLCJjb25zdCBncmVldCA9IChpbmRleDogbnVtYmVyKSA9PiB7XHJcbiAgY29uc3QgZ3JlZXRpbmdzID0gW1xyXG4gICAgXCJHb29kIG1vcm5pbmdcIixcclxuICAgIFwiSGVsbG9cIixcclxuICAgIFwiSGlcIixcclxuICAgIFwiR29vZCBldmVuaW5nXCIsXHJcbiAgICBcIkdvb2QgbmlnaHRcIixcclxuICAgIFwiU2VlIHlvdVwiXHJcbiAgXTtcclxuICBpZiAoaW5kZXggPj0gZ3JlZXRpbmdzLmxlbmd0aCkge1xyXG4gICAgcmV0dXJuIFwiVGhlIGluZGV4IHlvdSBhc3NpZ24gaXMgb3V0IG9mIHJhbmdlLlwiXHJcbiAgfVxyXG4gIHJldHVybiBncmVldGluZ3NbaW5kZXhdO1xyXG59O1xyXG5cclxuZXhwb3J0IHtcclxuICBncmVldFxyXG59O1xyXG4iLCJpbXBvcnQge1xyXG4gIGdyZWV0XHJcbn0gZnJvbSBcIi4vZ3JlZXRpbmdzXCI7XHJcblxyXG5jb25zdCBncmVldEZyb21Db21waWxlciA9IChncmVldGluZzogc3RyaW5nLCBjb21waWxlcjogc3RyaW5nKSA9PiB7XHJcbiAgcmV0dXJuIGAke2dyZWV0aW5nfSBmcm9tICR7Y29tcGlsZXJ9ISFgO1xyXG59O1xyXG5cclxuY29uc3Qgc2hvd0dyZWV0aW5nID0gKGRpdklEOiBzdHJpbmcsIG1lc3NhZ2U6IHN0cmluZykgPT4ge1xyXG4gIGNvbnN0IGVsZW0gPSBkb2N1bWVudC5nZXRFbGVtZW50QnlJZChkaXZJRCk7XHJcbiAgZWxlbS5pbm5lclRleHQgPSBtZXNzYWdlO1xyXG59O1xyXG5cclxuY29uc3QgZGl2SUQgPSBcImdyZWV0aW5nXCI7XHJcbmNvbnN0IGdyZWV0aW5nID0gZ3JlZXQoMSk7XHJcbmNvbnN0IGNvbXBpbGVyID0gXCJUeWVwU2NyaXB0XCI7XHJcbmNvbnN0IG1lc3NhZ2UgPSBncmVldEZyb21Db21waWxlcihncmVldGluZywgY29tcGlsZXIpO1xyXG5zaG93R3JlZXRpbmcoZGl2SUQsIG1lc3NhZ2UpO1xyXG5cclxuZXhwb3J0IHtcclxuICBncmVldEZyb21Db21waWxlclxyXG59O1xyXG4iXX0=
