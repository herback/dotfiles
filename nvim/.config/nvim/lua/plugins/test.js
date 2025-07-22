const peopleCounter = (people) => {
  for (let i = 0; i < people; i++) {
    console.log("Hello Darkness My old friend");
  }
};

peopleCounter(5);

const studentCounter = (student) => {
  for (let i = 0; i < student; i++) {
    peopleCounter(student);
  }
};

studentCounter(5);
