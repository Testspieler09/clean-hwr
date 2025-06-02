#import "@preview/glossarium:0.5.6": make-glossary, register-glossary, print-glossary
#import "@preview/acrostiche:0.5.2": init-acronyms, print-index, acr

#import "blocks/constants.typ": research_title, authors, date_of_publication

#set document(author: authors, title: research_title)
#set page(numbering: none, number-align: center)
#set text(font: "Libertinus Serif", lang: "en")
#set heading(numbering: "1.1")

// SETUP Glossary and Acronyms
#show: make-glossary
#import "blocks/glossary.typ": glossary, acronym-list
#register-glossary(glossary)
#init-acronyms(acronym-list)

// SETUP Biblography
#set bibliography(
  style: "ieee", // Change according to needs (assets/bib/hwr_citation.csl is also a valid option)
)
#let bib = bibliography("assets/bib/literature.bib")

// SETUP Main Body
#include "blocks/title.typ"
#pagebreak()

// Abstract
#include "blocks/abstract.typ"
#pagebreak()

// Content outline
#outline(depth: 3, indent: 2%)
#pagebreak()

#set par(justify: true)

// Note on Gender-Inclusive Language
#include "blocks/note.typ"
#pagebreak()

// Introduction
#include "blocks/intro.typ"
#pagebreak()

// Main content
#include "blocks/content.typ"
#pagebreak()

// Declaration of authorship
#include "blocks/declaration_of_authorship.typ"
#pagebreak()

// Glossary
#set heading(numbering: none)
#set page(numbering: "I")
= Glossary
#print-glossary(glossary)
#pagebreak()

// Acronyms
#print-index(outlined: true, title: "Acronyms")
#pagebreak()

// Biblography
#bib
#pagebreak()

// List of Figures
#let outline_title = "List of Figures"
#hide[#heading(outline_title)]
#outline(title: outline_title, target: figure.where(kind: image))
#pagebreak()

// Appendix
#include "blocks/appendix.typ"
