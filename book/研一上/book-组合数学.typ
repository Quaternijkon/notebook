// #import "@preview/ilm:1.1.2": *
#import "../../theme.typ": *
#import "../../lib.typ": *

#set text(
  lang: "zh",
  // font: "PingFang SC",
  // font: "JetBrains Mono",
)

#show: ilm.with(
  title: [组合数学],
  author: "Quaternijkon",
  date: datetime(year: 2024, month: 09, day: 12),
  abstract: [
    组合数学课程笔记
  ],
  preface: [
    #align(center + horizon)[
      

      
    ]
  ],
  // bibliography: bibliography("refs.bib"),
  // figure-index: (enabled: true),
  // table-index: (enabled: true),
  // listing-index: (enabled: true)
)

#show: codly-init.with()


#codly(
  languages: (
    rust: (name: "Rust", icon: "\u{fa53}", color: rgb("#CE412B")),
  )
)

#show: gentle-clues.with(
  headless: false,  // never show any headers
  breakable: true, // default breaking behavior
  header-inset: 0.5em, // default header-inset
  content-inset: 1em, // default content-inset
  stroke-width: 2pt, // default left stroke-width
  border-radius: 10pt, // default border-radius
  border-width: 1pt,  // default boarder-width
)

#show :show-cn-fakebold

#include "../../content/组合数学/ch1-鸽巢原理.typ"

#include "../../content/组合数学/课后习题.typ"