/*
input: object of student scores
output: two arrays, first one with strings of scores and second with average scores
rules:
- compute average exam score
- compute sum exercise score
- compute weights to determine final percentage grade
  - (exam average * .65) + (exercise average * .35)
- round percentage grade to to nearest integer
- map percentage grade to letter grade from table
- combine letter grade and percentage grade: '81 (C)'

*/


let studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

// save each object into a variable
// access 'scores' object:
  // use reduce() on exams to find average
  // divide total by array length
// repeat with exercises
// compute weights
// map percentage with letters
//

function mapLetterGrade(arrayOfScores) {
  let finalScores = [];

  for (let i = 0; i < arrayOfScores.length; i += 1) {
    let score = arrayOfScores[i];
    if (score >= 93) {
      finalScores.push(`${score} (A)`);
    } else if (score >= 85 && score < 93) {
      finalScores.push(`${score} (B)`);
    } else if (score >= 77 && score < 85) {
      finalScores.push(`${score} (C)`);
    } else if (score >= 69 && score < 77) {
      finalScores.push(`${score} (D)`);
    } else if (score >= 60 && score < 69) {
      finalScores.push(`${score} (E)`);
    } else {
      finalScores.push(`${score} (F)`);
    }
  }
  return finalScores;
}

function reduceScores(array) {
  return array.reduce((total, value) => total + value);
}

function computeExamAvg(examScores) {
  let examAvg = reduceScores(examScores);
  return examAvg / examScores.length;
}

function computeExerciseSum(exerciseScores) {
  return reduceScores(exerciseScores);
}

function generateStudentGrades(scoreObj) {
  const examWeight = 0.65;
  const exerciseWeight = 0.35;
  let result = [];
  let studentObj = Object.values(scoreObj);

  for (let i = 0; i < studentObj.length; i += 1) {
    let examAvg = computeExamAvg(studentObj[i].scores.exams);
    let exerciseSum = computeExerciseSum(studentObj[i].scores.exercises);

    result.push(Math.round((examAvg * examWeight) + (exerciseSum * exerciseWeight)));
  }

  return mapLetterGrade(result);
}

function generateExamSummary() {

}

function generateClassRecordSummary(scores) {
  return {
    studentGrades: generateStudentGrades(scores),
    exams: generateExamSummary(),
  };
}

console.log(generateClassRecordSummary(studentScores));

// returns:
{
  // studentGrades: [ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ],
  exams: [
    { average: 75.6, minimum: 50, maximum: 100 },
    { average: 86.4, minimum: 70, maximum: 100 },
    { average: 87.6, minimum: 60, maximum: 100 },
    { average: 91.8, minimum: 80, maximum: 100 },
  ],
}
