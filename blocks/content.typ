#import "@preview/glossarium:0.5.6": gls, glspl
#import "@preview/acrostiche:0.5.2": acr, acrpl

= Chapter

== Subchapter
#lorem(200)

== Citing
Here is a citation to an example book #footnote[Vgl. @doe2020].

== Acronyms
Acrotastic is a #acr("WTP")! This #acr("WTP") enables easy acronym manipulation.

== Glossaries
This is a reference to #gls("html"). The term #gls("css") is also defined.

== Figures
Here is a reference to the HWR Logo (@HWR)
#figure(image("../assets/images/header_logo.png", width: 80%), caption: "The HWR Logo")<HWR>
