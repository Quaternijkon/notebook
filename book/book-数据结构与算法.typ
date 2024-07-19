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
  bibliography: bibliography("refs.bib"),
  figure-index: (enabled: true),
  table-index: (enabled: true),
  listing-index: (enabled: true)
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

= 数据结构

数据结构是为实现对计算机数据有效使用的各种数据组织形式，服务于各类计算机操作。不同的数据结构具有各自对应的适用场景，旨在降低各种算法计算的时间与空间复杂度，达到最佳的任务执行效率。

#pagebreak()

#include "../content/数据结构与算法/.menu/menu-数组.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/menu-链表.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/menu-栈与队列.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/menu-字符串.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/menu-哈希表.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/menu-堆.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/menu-树.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/menu-图.typ"

= 算法

#pagebreak()

#include "../content/数据结构与算法/.menu/menu-二分查找.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/menu-排序算法.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/menu-滑动窗口与双指针.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/menu-递归与分治.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/menu-广度优先搜索.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/menu-深度优先搜索.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/menu-贪心算法.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/menu-动态规划.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/menu-前缀和.typ"

#pagebreak()

#include "../content/数据结构与算法/.menu/menu-数学.typ"

// = 数据结构

// == 数组

// == 链表

// == 栈

// == 队列

// == 字符串

// == 堆

// == 树

// == 图



// = 算法

// == 二分查找

// == 排序算法

// == 滑动窗口与双指针

// == 哈希表

// == 递归与分治

// == 广度优先搜索

// == 深度优先搜索

// == 贪心算法

// == 动态规划

// == 前缀和

// == 位运算与数学



