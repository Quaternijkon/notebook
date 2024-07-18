// #import "@preview/ilm:1.1.2": *
#import "../theme.typ": *
#import "../lib.typ": *

#set text(
  lang: "zh",
  // font: "PingFang SC",
  // font: "JetBrains Mono",
)

#show: ilm.with(
  title: [文献阅读],
  author: "Quaternijkon",
  date: datetime(year: 2024, month: 07, day: 2),
  abstract: [
    阅读各种文献的整理记录。
  ],
  preface: [
    #align(center + horizon)[
      // 主要来源于#link("https://leetcode.cn/")[_力扣_] 
      这个人很懒，什么都没有留下。

      
    ]
    
  ],
  bibliography: bibliography("refs.bib"),
  figure-index: (enabled: true),
  table-index: (enabled: true),
  listing-index: (enabled: true)
)

#show: codly-init.with()

#include "../content/文献阅读/menu.typ"
