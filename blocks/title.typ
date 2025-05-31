#import "constants.typ": authors, research_title, logo, date_of_publication

#set document(author: authors, title: research_title)
#set page(numbering: none, number-align: center)
#set text(font: "Libertinus Serif", lang: "en")
#set heading(numbering: "1.1")

#v(0.6fr)
#if logo != none {
  align(right, image(logo, width: 26%))
}
#v(9.6fr)

#text(1.1em, date_of_publication)
#v(1.2em, weak: true)
#text(2em, weight: 700, research_title)

// Author information.
#pad(
  top: 0.7em,
  right: 20%,
  grid(
    columns: (1fr,) * calc.min(3, authors.len()),
    gutter: 1em,
    ..authors.map(author => align(start, strong(author))),
  ),
)

#v(2.4fr)
