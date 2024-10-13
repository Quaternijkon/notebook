// #import "@preview/ilm:1.1.2": *
#import "../../theme.typ": *
#import "../../lib.typ": *

#set text(
  lang: "zh",
  // font: "PingFang SC",
  // font: "JetBrains Mono",
)

#show: ilm.with(
  title: [计算机应用数学],
  author: "Quaternijkon",
  date: datetime(year: 2024, month: 09, day: 10),
  abstract: [
    计算机应用数学课程笔记
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

#set math.mat(delim: "[")

#include "../../content/计算机应用数学/随机游走与马尔可夫链.typ"

#include "../../content/计算机应用数学/距离和散度.typ"
