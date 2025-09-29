#import "@preview/grape-suite:3.1.0": exercise
#import exercise: project, task, subtask
#show selector(heading.where(level: 2)): set heading(numbering: none)
#show selector(heading.where(level: 3)): set heading(numbering: none)
#show selector(heading.where(level: 4)): set heading(numbering: none)

#show: project.with(
    title: "Homework Collection 2",

    university: [University of Colorado, Denver],
    semester: [Fall 2025],
    seminar: [MATH 5939 - Linear Programming],

    show-outline: true,

    author: "Brady Lamson",

    show-solutions: false,
    show-lines: false,
    type: "Homework Sheet"
)

#include "18-5.typ"

#include "20-4.typ"