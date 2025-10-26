#import "@preview/grape-suite:3.1.0": exercise
#import exercise: project, task, subtask
#show selector(heading.where(level: 2)): set heading(numbering: none)
#show selector(heading.where(level: 3)): set heading(numbering: none)
#show selector(heading.where(level: 4)): set heading(numbering: none)
// #set thmbox.qed: "∎"

#show: project.with(
    title: "Homework Collection 3",

    university: [University of Colorado, Denver],
    semester: [Fall 2025],
    seminar: [MATH 5939 - Linear Programming],

    show-outline: false,

    author: "Brady Lamson",

    show-solutions: false,
    show-lines: false,
    type: "Homework Sheet"
)

#import "@preview/thmbox:0.3.0": *
#show: thmbox-init()

#outline(depth:2, title: "Table of Contents")

#pagebreak()

#include "hw16.typ"

#pagebreak()

#include "hw17.typ"
