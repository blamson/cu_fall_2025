#import "@preview/grape-suite:3.1.0": exercise
#import exercise: project, task, subtask
#show selector(heading.where(level: 2)): set heading(numbering: none)
#show selector(heading.where(level: 3)): set heading(numbering: none)
#show selector(heading.where(level: 4)): set heading(numbering: none)
// #set thmbox.qed: "∎"

#show: project.with(
    title: "Homework Collection 2",

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

#include "hw8.typ"

#pagebreak()

#include "hw9.typ"

#pagebreak()

#include "hw10.typ"

#pagebreak()

#include "hw11.typ"

#pagebreak()

#include "hw12.typ"

#pagebreak()

#include "hw13.typ"

#pagebreak()

#include "hw14.typ"