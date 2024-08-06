// #import "@preview/ilm:1.1.2": *
#import "../theme.typ": *
#import "../lib.typ": *

#set text(
  lang: "zh",
  // font: "PingFang SC",
  // font: "JetBrains Mono",
)

#show: ilm.with(
  title: [数据结构与算法],
  author: "Quaternijkon",
  date: datetime(year: 2024, month: 07, day: 2),
  abstract: [
    数据结构与算法刷题本
  ],
  preface: [
    #align(center + horizon)[
      主要来源于#link("https://leetcode.cn/")[_力扣_] 

      
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

= 数据结构

#xquotation(
  first: [

  ], second: [
    
  ]
)

#pagebreak()

#include "../content/数据结构与算法/.menu/.menu-数据结构/menu-数组.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/.menu-数据结构/menu-链表.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/.menu-数据结构/menu-栈与队列.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/.menu-数据结构/menu-字符串.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/.menu-数据结构/menu-哈希表.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/.menu-数据结构/menu-堆.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/.menu-数据结构/menu-树.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/.menu-数据结构/menu-图.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/.menu-数据结构/menu-并查集.typ"

= 算法

#xquotation(
  first: [
- @字符串匹配 ------ KMP算法
  ], second: [
    
  ]
)

#pagebreak()

#include "../content/数据结构与算法/.menu/.menu-算法/menu-二分查找.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/.menu-算法/menu-排序算法.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/.menu-算法/menu-滑动窗口与双指针.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/.menu-算法/menu-递归.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/.menu-算法/menu-分治.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/.menu-算法/menu-广度优先搜索.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/.menu-算法/menu-深度优先搜索.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/.menu-算法/menu-贪心算法.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/.menu-算法/menu-动态规划.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/.menu-算法/menu-最短路径.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/.menu-算法/menu-最小生成树.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/.menu-算法/menu-前缀和.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/.menu-算法/menu-数学.typ"

= 题集

#pagebreak()





