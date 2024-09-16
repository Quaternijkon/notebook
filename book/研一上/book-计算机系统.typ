// #import "@preview/ilm:1.1.2": *
#import "../../theme.typ": *
#import "../../lib.typ": *

#set text(
  lang: "zh",
  // font: "PingFang SC",
  // font: "JetBrains Mono",
)

#show link: underline

#show: ilm.with(
  title: [计算机系统],
  author: "Quaternijkon",
  date: datetime(year: 2024, month: 09, day: 13),
  abstract: [
    计算机系统课程笔记
  ],
  preface: [
    #align(horizon)[
    参考书目：
    - #link("https://zh.singlelogin.re/book/3597774/c5c57a/computer-systems-a-programmers-perspective.html")[Computer Systems: A Programmer’s Perspective -- Randal E. Bryant, David R. O’Hallaron]
    - #link("https://zh.singlelogin.re/book/3624006/0aa1ec/%E6%B7%B1%E5%85%A5%E7%90%86%E8%A7%A3%E8%AE%A1%E7%AE%97%E6%9C%BA%E7%B3%BB%E7%BB%9F.html")[深入理解计算机系统 -- Randal E. Bryant, David R. O’Hallaron]

      
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

= 计算机系统