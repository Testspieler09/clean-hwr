#let hwr(
  language: "en",

  // Main Metadata for the title page
  metadata: (
    title: [PTB Template],
    student_id: "XXXXXXXXXXXXXXXX",
    authors: ("Pépe Hanisch",),
    field_of_study: "Computer Science",
    company: "SAP SE",
    enrollment_year: "2024",
    semester: "2",
    company_supervisor: "Max Mustermann",
  ),
  custom_entries: (),
  word_count: none,
  university: "Berlin School of Economics and Law",
  date_of_publication: datetime.today().display(),
  uni-logo: "template/images/header_logo.png",
  company-logo: none,

  // Abstract content
  abstract: [#lorem(30)],

  note-gender-inclusive-language: (
    enabled: false,
    title: "Hinweis zum sprachlichen Gendern"
  ),

  // All the lists and outlines
  glossary: (
    enabled: true,
    title: "Glossary",
    entries: (
      (
        key: "html",
        short: "HTML",
        long: "Hypertext Markup Language",
        description: "A standard language for creating web pages",
        group: "Web"
      ),
    )
  ),
  acronyms: (
    enabled: true,
    title: "Acronyms",
    entries: (
    )
  ),
  bibliography-object: none,
  citation_style: "template/hwr_citation.csl",
  figure-index: (
    enabled: true,
    title: "Index of Figures"
  ),
  table-index: (
    enabled: true,
    title: "Index of Tables"
  ),
  listing-index: (
    enabled: true,
    title: "Index of Listings"
  ),

  appendix: [
    = Appendix
    Add some appendix here
  ],

  body,
) = {
  import "@preview/acrostiche:0.5.2": *

  set document(author: metadata.authors, title: metadata.title)
  set page(numbering: none, number-align: center)
  set text(font: "TeX Gyre Termes", lang: language)
  set heading(numbering: "1.1")

  // SETUP Acronyms
  if acronyms.enabled and acronyms.entries != () {
    init-acronyms(acronyms)
  }

  // SETUP Title page
  let equal_spacing = 0.25fr
  set align(center)

  // Logo settings
  v(equal_spacing)
  if uni-logo != none and company-logo != none {
    grid(
      columns: (1fr, 1fr),
      rows: (auto),
      grid.cell(
        colspan: 1,
        align: center,
        image(uni-logo, width: 70%),
      ),
      grid.cell(
        colspan: 1,
        align: center,
        image(company-logo, width: 70%),
      ),
    )
  } else if uni-logo != none {
    grid(
      columns: (0.5fr),
      rows: (auto),
      column-gutter: 100pt,
      row-gutter: 7pt,
      grid.cell(
        colspan: 1,
        align: center,
        image(uni-logo, width: 46%),
      )
    )
  } else if company-logo != none {
    grid(
      columns: (0.5fr),
      rows: (auto),
      column-gutter: 100pt,
      row-gutter: 7pt,
      grid.cell(
        colspan: 1,
        align: center,
        image(company-logo, width: 46%),
      )
    )
  }
  v(equal_spacing)

  // Title settings
  let line_length = 90%
  line(length: line_length)
  text(2em, weight: 700, metadata.title)
  line(length: line_length)

  // Author information.
  pad(
    top: 2.9em,
    grid(
      columns: (1fr,) * calc.min(3, metadata.authors.len()),
      gutter: 1em,
      ..metadata.authors.map(author => text(1.3em, strong(author))),
    ),
  )

  // Middle section
  if language == "de" {
    text(1.1em, [vorgelegt am #date_of_publication])
  } else {
    text(1.1em, [published on #date_of_publication])
  }
  v(0.6em, weak: true)
  $circle.filled.small$
  v(0.6em, weak: true)
  metadata.field_of_study
  v(0.6em, weak: true)
  university

  v(equal_spacing)

  let merge_entries(defaults, customs) = {
    let base = defaults
    for entry in customs {
      let idx = entry.at("index", default: base.len())
      base.insert(idx, (entry.key, entry.value))
    }
    base
  }

  if language == "de" {
    let default_entries = (
      ("Unternehmen:", metadata.company),
      ("Studienjahrgang:", metadata.enrollment_year),
      ("Semester:", metadata.semester),
      ("Matrikelnummer:", metadata.student_id),
      ("Betreuer im Unternehmen:", metadata.company_supervisor),
      ("Anzahl der Wörter:", word_count),
    )

    let final_entries = merge_entries(default_entries, custom_entries)

    show table.cell.where(x: 0): strong
    table(
      columns: 2,
      stroke: none,
      align: left,
      column-gutter: 5%,
      ..final_entries.flatten()
    )
  } else {
    let default_entries = (
      ("Company:", metadata.company),
      ("Enrollment Year:", metadata.enrollment_year),
      ("Semester:", metadata.semester),
      ("Student ID:", metadata.student_id),
      ("Company Supervisor:", metadata.company_supervisor),
      ("Word Count:", word_count),
    )

    let final_entries = merge_entries(default_entries, custom_entries)

    show table.cell.where(x: 0): strong
    table(
      columns: 2,
      stroke: none,
      align: left,
      column-gutter: 5%,
      ..final_entries.flatten()
    )
  }

  v(2*equal_spacing)

  if language == "de" {
    table(
      columns: (50%,50%),
      stroke: none,
      inset: 20pt,
      align: left,
      [#line(length: 100%)Unterschrift Ausbilder*in],
      [#line(length: 100%)Unterschrift Betreuer*in (HWR)],
    )
  } else {
    table(
      columns: (50%,50%),
      stroke: none,
      inset: 20pt,
      align: left,
      [#line(length: 100%)Signature of Supervisor (Company)],
      [#line(length: 100%)Signature of Supervisor (HWR)],
    )
  }

  v(equal_spacing)
  pagebreak()
  set align(left)
  // END OF TITLE PAGE

  // Abstract
  set page(numbering: "I", number-align: center)
  v(1fr)
  align(center)[
    #heading(
      outlined: false,
      numbering: none,
      text(0.85em, smallcaps[Abstract]),
    )
    #abstract
  ]
  v(1.618fr)
  pagebreak()

  // Content outline
  outline(depth: 3, indent: 2%)
  pagebreak()

  set par(justify: true)

  if note-gender-inclusive-language.enabled and language == "de" {
    heading(note-gender-inclusive-language.title, numbering: none)
    [
      Aus Gründen der besseren Lesbarkeit wird im Text verallgemeinernd das generische Maskulinum verwendet.
      Diese Formulierungen umfassen gleichermaßen weibliche, männliche und diverse Personen.
    ]
    pagebreak()
  }
  set page(numbering: "1")

  body

  // Settings for pages after main body
  set heading(numbering: none)
  set page(numbering: "I")

  // Declaration of authorship
  if language == "de" {
    heading("Ehrenwörtliche Erkärung", numbering: none)
    [
      Ich erkläre ehrenwörtlich:

       + dass ich meinen Praxistransferbericht selbstständig verfasst habe,
       + dass ich die Übernahme wörtlicher Zitate aus der Literatur sowie die Verwendung der Gedanken anderer
        Autoren an den entsprechenden Stellen innerhalb der Arbeit gekennzeichnet habe,
       + dass ich meinen Praxistransferbericht bei keiner anderen Prüfung vorgelegt habe.

       Ich bin mir bewusst, dass eine falsche Erklärung rechtliche Folgen haben wird.
    ]
    v(4.0em)

    table(
      columns: (50%,50%),
      stroke: none,
      inset: 20pt,
      [#line(length: 100%)Ort, Datum], [#line(length: 100%)Unterschrift],
    )
    pagebreak()
  } else {
    heading("Declaration of Authorship", numbering: none)
    [
      I hereby declare that this work titled “#metadata.title” is my own and has been carried out independently,
      without the use of any sources or aids other than those stated.
      All passages that have been quoted directly or indirectly from other works have been clearly marked and referenced.

      I confirm that this work has not been submitted, either in whole or in part, for any other academic degree or qualification.
    ]
    v(4.0em)

    table(
      columns: (50%,50%),
      stroke: none,
      inset: 20pt,
      [#line(length: 100%)City, Date], [#line(length: 100%)Signature],
    )
    pagebreak()
  }

  // Glossary
  if glossary.enabled {
    import "@preview/glossarium:0.5.6": *
    show: make-glossary
    register-glossary(glossary.entries)

    heading(glossary.title)
    print-glossary(glossary.entries)
    pagebreak()
  }

  // Acronyms
  if acronyms.enabled and acronyms.entries != () {
    print-index(outlined: true, title: acronyms.title)
    pagebreak()
  }

  // Biblography
  if bibliography-object != none {
    set bibliography(style: citation_style)
    bibliography-object
    pagebreak()
  }

  // Display indices of figures, tables, and listings.
  let fig-t(kind) = figure.where(kind: kind)
  let has-fig(kind) = counter(fig-t(kind)).get().at(0) > 0
  if figure-index.enabled or table-index.enabled or listing-index.enabled {
    show outline: set heading(outlined: true)
    context {
      let imgs = figure-index.enabled and has-fig(image)
      let tbls = table-index.enabled and has-fig(table)
      let lsts = listing-index.enabled and has-fig(raw)
      if imgs {
        outline(
          title: figure-index.at("title", default: "Index of Figures"),
          target: fig-t(image),
        )
      }
      if tbls {
        outline(
          title: table-index.at("title", default: "Index of Tables"),
          target: fig-t(table),
        )
      }
      if lsts {
        outline(
          title: listing-index.at("title", default: "Index of Listings"),
          target: fig-t(raw),
        )
      }
      if imgs or tbls or lsts {
        pagebreak()
      }
    }
  }

  // Appendix
  appendix
}
