#import "@preview/hwr-template:0.1.0": *

// These packages are used to displaying the acronyms and glossaries
// It needs to be imported here so you can use #acr / #gls
// to reference them
#import "@preview/acrostiche:0.5.2": *
#import "@preview/glossarium:0.5.6": *

// Count words automatically
#import "@preview/wordometer:0.1.4": word-count, total-words
#show: word-count

#show : hwr.with(
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
  custom_entries: (
    (key: "Some value", value: "Ditto", index: 2),
    (key: "GitHub", value: "Testspieler09", index: 0),
),
  acronyms: (entries: ("WTP": ("Wonderful Typst Package", "Wonderful Typst Packages"))),
  glossary: (
    entries: ((
      key: "kuleuven",
      short: "KU Leuven",
      long: "Katholieke Universiteit Leuven",
      description: "A university in Belgium.",
    ),)
  ),
  bibliography-object: bibliography("refs.bib"),
  word_count: total-words,
)

= What is quantum computing <chap1>
#lorem(400)
#pagebreak()

= Qubits and Kets
#lorem(200)

#acr("WTP")

Now we reference @chap1
#footnote[cf. @Cooley65]
#footnote[cf. #gls("kuleuven")]

#let unit(u) = math.display(math.upright(u))
#let si-table = table(
  columns: 3,
  table.header[Quantity][Symbol][Unit],
  [length], [$l$], [#unit("m")],
  [mass], [$m$], [#unit("kg")],
  [time], [$t$], [#unit("s")],
  [electric current], [$I$], [#unit("A")],
  [temperature], [$T$], [#unit("K")],
  [amount of substance], [$n$], [#unit("mol")],
  [luminous intensity], [$I_v$], [#unit("cd")],
)
#[
  #set table(inset: 5pt, stroke: 1pt + black)
  #show table.cell.where(y: 0): it => {
    v(0.5em)
    h(0.5em) + it.body.text + h(0.5em)
    v(0.5em)
  }
  #figure(caption: [Typst's default styling], si-table)
]

#let snip(cap) = figure(caption: cap)[
  ```rust
  fn main() {
      let user = ("Adrian", 38);
      println!("User {} is {} years old", user.0, user.1);

      // tuples within tuples
      let employee = (("Adrian", 38), "die Mobiliar");
      println!("User {} is {} years old and works for {}", employee.0.1, employee.0.1, employee.1);
  }
  ```
]

#show raw: set text(font: "Fira Mono")
For comparison, here is what `code` in Fira Mono looks like:
#snip("Code snippet typeset in Fira Mono font")

#show raw: set text(font: ("Iosevka", "Fira Mono"))
and here is how the same `code` looks in Iosevka:
#snip("Code snippet typeset in Iosevka font")

#figure(image("images/header_logo.png", width: 80%), caption: "The HWR Logo")<HWR>

== Visualization
#lorem(233)

== Subchapter
#lorem(60)
