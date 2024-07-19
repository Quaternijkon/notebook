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

= 数据结构

#pagebreak()

#include "../content/数据结构与算法/menu-数组.typ"

#pagebreak()

#include "../content/数据结构与算法/menu-链表.typ"

#pagebreak()

#include "../content/数据结构与算法/menu-栈.typ"

#pagebreak()

#include "../content/数据结构与算法/menu-队列.typ"

#pagebreak()

#include "../content/数据结构与算法/menu-字符串.typ"

#pagebreak()

#include "../content/数据结构与算法/menu-堆.typ"

#pagebreak()

#include "../content/数据结构与算法/menu-树.typ"

#pagebreak()

#include "../content/数据结构与算法/menu-图.typ"

= 算法

#pagebreak()

#include "../content/数据结构与算法/menu-二分查找.typ"

#pagebreak()

#include "../content/数据结构与算法/menu-排序算法.typ"

#pagebreak()

#include "../content/数据结构与算法/menu-滑动窗口与双指针.typ"

#pagebreak()

#include "../content/数据结构与算法/menu-哈希表.typ"

#pagebreak()

#include "../content/数据结构与算法/menu-递归与分治.typ"

#pagebreak()

#include "../content/数据结构与算法/menu-广度优先搜索.typ"

#pagebreak()

#include "../content/数据结构与算法/menu-深度优先搜索.typ"

#pagebreak()

#include "../content/数据结构与算法/menu-贪心算法.typ"

#pagebreak()

#include "../content/数据结构与算法/menu-动态规划.typ"

#pagebreak()

#include "../content/数据结构与算法/menu-前缀和.typ"

#pagebreak()

#include "../content/数据结构与算法/menu-数学.typ"

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



