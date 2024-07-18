// #import "@preview/ilm:1.1.2": *
#import "../lib.typ": *

#set text(
  lang: "zh",
  // font: "PingFang SC",
  // font: "JetBrains Mono",
)

#show: ilm.with(
  title: [数据结构与算法],
  author: "dry",
  date: datetime(year: 2024, month: 07, day: 2),
  abstract: [
    关于数据结构与算法的学习笔记。
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

= 数据结构

#include "../content/数据结构与算法/数组.typ"

= 算法

// = 数据结构

// == 数组

// == 链表

// === 反转链表

// 题目描述：

// 给定单链表的头节点 `head` ，请反转链表，并返回反转后的链表的头节点。

// 示例1:

// ```plaintext
// 输入:head = [1,2,3,4,5]
// 输出:[5,4,3,2,1]
// ```

// 示例2:


// ```plaintext
// 输入:head = [1,2]
// 输出:[2,1]
// ```


// == 栈

// == 队列

// == 字符串

// == 哈希表

// == 堆

// == 树

// == 图



// = 算法

// == 二分查找

// == 排序算法

// == 滑动窗口与双指针

// == 递归与分治

// == 广度优先搜索

// == 深度优先搜索

// == 贪心算法

// == 动态规划

// == 前缀和

// == 位运算与数学



