#import "template.typ": *

#set bibliography(
  style: "ieee", // Change according to needs (hwr_citation.csl is also a valid option)
)

#let bib = bibliography("literatur.bib")

#import "blocks/constants.typ" as c

#import "blocks/abstract.typ" as abstract

#show: project.with(
  title: c.research_title,
  authors: c.authors,
  abstract: abstract.abstract_content,
  date: c.date_of_publication,
  logo: "images/header_logo.png",
)

#include "blocks/intro.typ"
#pagebreak()

#include "blocks/chapter1.typ"
#pagebreak()

#bib
