#import "../../lib.typ": *

= 随机游走与马尔可夫链

== Introduction

=== Definition

*随机游走* 在有向图上：从一个起始顶点生成一系列顶点，每次随机选择一个出边，沿着这条边移动到一个新的顶点，并重复这个过程。
正式定义如下：

$ p(t)P = p(t+1) $

其中， $p(t)$  是一个行向量，它的每个分量表示在时间  $t$  时每个顶点的概率质量分布， $P$  是所谓的转移矩阵， $P_(i,j)$  是游走从顶点  $i$  选择顶点  $j$  的概率。

#figure(
  image("img/1.png", width: 50%), caption: [邻接矩阵与转移矩阵]
)

#figure(
  image("img/2.png", width: 50%), caption: [随机游走]
)

// #figure(
//   table(
//     stroke: none, 
//     columns: 2,
//     align: left,
//     table.hline(),
//     table.header(
//       [*Random walk*],[*Markov chain*],
//     ),
//     table.hline(),
//     [图 Graph], [随机过程 Stochastic process],[顶点 Vertex], [状态 State],[强连通 Strongly connected], [持续 Persistent],
//     [非周期的 Aperiodic], [非周期的 Aperiodic],
//     [强连通且非周期的 Strongly connected and aperiodic], [遍历的 Ergodic],
//     [无向图 Undirected graph], [时间可逆的 Time reversible],
//     table.hline(),
//   ),
//   kind:"table",
//   supplement: [表],
//   caption: [随机游走与马尔可夫链] 
// )
// 
  // #let content=

  #llltable(
    titles: ([Random walk],[Markov chain]),
    caption: [随机游走与马尔可夫链],
    [图 Graph], [随机过程 Stochastic process],[顶点 Vertex], [状态 State],[强连通 Strongly connected], [持续 Persistent],[非周期的 Aperiodic], [非周期的 Aperiodic],[强连通且非周期的 Strongly connected and aperiodic], [遍历的 Ergodic],[无向图 Undirected graph], [时间可逆的 Time reversible]
    
  )



// #table(
//   stroke: none,

//   columns: 3,
//   table.header(
//     [Substance],
//     [Subcritical °C],
//     [Supercritical °C],
//   ),
//   [Hydrochloric Acid],
//   [12.0], [92.1],
//   [Sodium Myreth Sulfate],
//   [16.6], [104],
//   [Potassium Hydroxide],
//   table.cell(colspan: 2)[24.7],
// )

// #table(
//   stroke: none,
//   columns: (auto, 1fr),
//   [09:00], [Badge pick up],
//   [09:45], [Opening Keynote],
//   [10:30], [Talk: Typst's Future],
//   [11:15], [Session: Good PRs],
//   table.hline(start: 1),
//   [Noon], [_Lunch break_],
//   table.hline(start: 1),
//   [14:00], [Talk: Tracked Layout],
//   [15:00], [Talk: Automations],
//   [16:00], [Workshop: Tables],
//   table.hline(),
//   [19:00], [Day 1 Attendee Mixer],
// )
