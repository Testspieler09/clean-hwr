#import "constants.typ": *

#set document(author: authors, title: research_title)
#set page(numbering: none, number-align: center)
#set text(font: "Libertinus Serif", lang: "en")
#set heading(numbering: "1.1")

#let equal_spacing = 0.25fr

// NOTE: I align everything center here
#set align(center)

// Logo settings
#v(equal_spacing)
#if logo != none {
  image(logo, width: 46%)
}
#v(equal_spacing)

// Title settings
#let line_length = 90%
#line(length: line_length)
#text(2em, weight: 700, research_title)
#line(length: line_length)

// Author information.
#pad(
  top: 2.9em,
  grid(
    columns: (1fr,) * calc.min(3, authors.len()),
    gutter: 1em,
    ..authors.map(author => text(1.3em, strong(author))),
  ),
)

// Middle section
#align(center, text(1.1em, [published on:  #date_of_publication]))
#v(0.6em, weak: true)
$circle.filled.small$
#v(0.6em, weak: true)
#field_of_study
#v(0.6em, weak: true)
#university

#v(equal_spacing)

#table(
  columns: 2,
  stroke: none,
  align: left,
  column-gutter: 5%,
  [*Company:*], [#company],
  [*Enrollment Year:*], [#enrollment_year],
  [*Semester:*], [#semester],
  [*Student ID:*], [#student_id],
  [*Company Supervisor:*], [#company_supervisor],
  [*Word Count:*], [#word_count],
)

#v(2*equal_spacing)

#table(
  columns: (50%,50%),
  stroke: none,
  inset: 20pt,
  align: left,
  [#line(length: 100%)Signature of Supervisor (Company)], [#line(length: 100%)Signature of Supervisor (HWR)],
)

#v(equal_spacing)
