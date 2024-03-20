const greet = (index: number) => {
  const greetings = [
    "Good morning",
    "Hello",
    "Hi",
    "Good evening",
    "Good night",
    "See you"
  ];
  if (index >= greetings.length) {
    return "The index you assign is out of range."
  }
  return greetings[index];
};

export {
  greet
};
