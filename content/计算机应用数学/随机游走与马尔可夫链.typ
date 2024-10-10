#import "../../lib.typ": *

#set math.equation(numbering: none)

= 随机游走与马尔可夫链

== 引言

*Definition*

*随机游走* 在有向图上：从一个起始顶点生成一系列顶点，每次随机选择一个出边，沿着这条边移动到一个新的顶点，并重复这个过程。
正式定义如下：

$ p(t)P = p(t+1) $

其中， $p(t)$  是一个行向量，它的每个分量表示在时间  $t$  时每个顶点的概率质量分布， $P$  是所谓的转移矩阵， $P_(i,j)$  是游走从顶点  $i$  选择顶点  $j$  的概率。

*Example*

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
*Markov链*

有限的状态集合。

$p_(x y)$：从状态$x$到状态$y$的转移概率，$sum_y p_(x y) = 1$。

Markov链可以表示为有向图，其中从顶点x到顶点y的权重为$p_(x y)$。



  #llltable(
    titles:table.header(
      [*Random walk*],[*Markov chain*]
    ),
    columns:2,
    caption: [随机游走与马尔可夫链],
    [图 Graph], [随机过程 Stochastic process],[顶点 Vertex], [状态 State],[强连通 Strongly connected], [持续 Persistent],[非周期的 Aperiodic], [非周期的 Aperiodic],[强连通且非周期的 Strongly connected and aperiodic], [遍历的 Ergodic],[无向图 Undirected graph], [时间可逆的 Time reversible]
    
  )


我们将在本节中介绍以下内容：
- 示例：PageRank和Markov决策过程。
- 平稳分布。
- 收敛性。
- Markov过程。  



*Example*

*PageRank*

将网页看作一个图：每个网页是一个顶点，超链接是边。  

目标：根据重要性对网页进行排序。

*Insight*  

一个网页的链接越多，它就越重要。  

将入链看作投票，著名网站有更多的入链。  

此外，来自重要网页的链接权重更大。

#figure(
  image("img/3.png", width: 50%),
  caption: []
)


*随机邻接矩阵*

$d_i$ 是节点 $i$ 的度。  

如果 $i arrow j$，则 $M_(j i) = 1/d_i$。  

*排序向量*  

$r_i$ 是页面 $i$ 的重要性得分。  

公式 (\*) 可以重写为：  

$r = M dot r$
 

*Example*

#figure(
  image("img/4.png", width: 50%),
  caption: []
)


*第一次迭代*  


#align(center)[$mat(
  1/3;
  1/2;
  1/6
)
=
mat(
  1/2, 1/2, 0;
  1/2, 0, 1;
  0, 1/2, 0
)
dot
mat(
  1/3;
  1/3;
  1/3
)$]



#align(center)[$P R(Y)^1 = 1/2 P R(Y)^0 + 1/2 P R(A)^0 = 1/2 dot 1/3 + 1/2 dot 1/3 = 1/3$

$P R(A)^1 = 1/2 P R(Y)^0 + 1 dot P R(M)^0 = 1/2 dot 1/3 + 1/3 = 3/6$

$P R(M)^1 = 1/2 P R(A)^0 = 1/2 dot 1/3 = 1/6$]

*第二次迭代*  

#align(center)[$mat(
  5/12;
  1/3;
  1/4
)
=
mat(
  1/2, 1/2, 0;
  1/2, 0, 1;
  0, 1/2, 0
)
dot
mat(
  1/3;
  1/2;
  1/6
)$]

...

*收敛*  

#align(center)[$mat(
  2/5;
  2/5;
  1/5
)
=
mat(
  1/2, 1/2, 0;
  1/2, 0, 1;
  0, 1/2, 0
)
dot
mat(
  2/5;
  2/5;
  1/5
)$]

*Markov过程*（Markov决策过程）  

#align(center)[#mi(
  `
\mathcal{S}, \mathcal{A}, \mathcal{R}, \mathbb{P}, \gamma
  `
)]

#mitext(`

\(\mathcal{S}\)：状态集合。

\(\mathcal{A}\)：动作集合。  

\(\mathcal{R}\)：在状态\(s\)下执行动作\(a\)的奖励\(r(s, a)\)。

\(\mathbb{P}\)：在状态 \(s\) 下执行动作 \(a\) 后转移到下一个状态 \(s'\) 的转移概率 \(P(s' | s, a)\)。  

\(\gamma\)：折扣因子。
`)

*MDP（Markov决策过程）*：

#algo(caption:[Markov决策过程],content:[
  #pseudocode-list(hooks: .5em)[
+ #mi(`\(t = 0\) 初始状态 \(s_0 \sim p(s_0)\)`)
+ #mi(`对于 \(t = 0\) 到结束：`)
  + #mi(`执行动作 \(a_t\)`)
  + #mi(`获得奖励 \(r_t \sim R(\cdot | s_t, a_t)\)`)
  + #mi(`获得下一个状态 \(s_{t+1} \sim P(\cdot | s_t, a_t)\)`)
  + #mi(`代理获得奖励 \(r_t\) 和状态 \(s_{t+1}\)`)
  ]
])
  
*目标*：最大化长期奖励（累计奖励）#mi(`\(\sum_{t \geq 0} D^t r_t\)`)。

*Example*

#figure(
  image("img/5.png", width: 20%),
  caption: []
)

动作集合 = {左, 右, 上, 下}  
到达空白格的奖励 → 使用最小化的动作数到达终点状态。

== 平稳分布 Stationary Distribution

#mitext(`设 \(p_t\) 是随机游走经过 \(t\) 步后的概率分布。通过以下公式定义长期平均概率分布 \(a_t\)：

\[
a_t = \frac{1}{t} \left( p_0 + p_1 + \cdots + p_{t-1} \right)
\]`)

Markov链的基本定理：  

对于一个连通的Markov链，它收敛于一个极限概率向量 x，满足：

#mitex(`XP = x; \sum_i x_i = 1 \Rightarrow X[P - I, 1] = [0, 1]`)

*引理 1.3.1* 设 $P$ 是一个连通的Markov链的转移概率矩阵。通过在矩阵 $P - I$ 上增加一列1的列构造出的 $n times (n+1)$ 矩阵 $A = [P - I, 1]$ 的秩为 $n$。

*证明*：作业

*定理 1.3.2* 设 P 是连通Markov链的转移概率矩阵，则存在一个唯一的概率向量 $pi$ 满足 #mi(`\pi P = \pi`)。此外，对于任何初始分布，#mi(`\lim_{t \to \infty} a_t`) 存在且等于 $pi$。

*证明*：考虑 #mi(`\(a_t\)`) 和 #mi(`\(a_{t+1}\)`) 的差，#mi(`a_t - a_{t+1} = a_t P`)：

#mitex(`
\begin{align*}
a_t P - a_t &= \frac{1}{t} \left[ p_0 P + p_1 P + \cdots + p_{t-1} P \right] - \frac{1}{t} \left[ p_0 + p_1 + \cdots + p_{t-1} \right] \\
           &= \frac{1}{t} \left[ p_1 + p_2 + \cdots + p_t \right] - \frac{1}{t} \left[ p_0 + p_1 + \cdots + p_{t-1} \right] \\
           &= \frac{1}{t} (p_t - p_0)
\end{align*}

`)

因此，#mi(`b_t = a_t P - a_t`) 满足 #mi(`|b_t| \leq \frac{2}{t}`)，并且当 #mi(`\(t \to \infty\)`) 时趋于0。 

根据引理 1.3.1，#mi(`A = [P - I, 1]`) 的秩为 #mi(`\(n\)`)。  
由于 $A$ 的所有行和为0，#mi(`n \times n`) 矩阵 $B$ 中除了最后一列以外的所有列是可逆的。  

令 #mi(`c_t`) 由 #mi(`b_t = a_t P - a_t`) 去掉第一列得到，使得 #mi(`a_t B = [c_t, 1]`)。

因此 #mi(`a_t \to [c_t, 1] \to [0, 1]`) 并且 #mi(`a_t \to [0, 1] B^{-1}`)。

因此 #mi(`a_t \to \pi`)，我们得出 $pi$ 是一个概率向量。  

由于 #mi(`a_t [P - I] = b_t \to 0`) ，我们得到 #mi(`\pi [P - I] = 0`)。  

由于 $A$ 的秩为 $n$，这是唯一的解，如所要求的。  

*引理 1.3.3* 对于在强连通图上的随机游走，若边上带有概率，向量 $pi$ 满足 #mi(`\pi_x p_{xy} = \pi_y p_{yx}`) 对于所有 #mi(`\(x\) 和 \(y\)`)，且 #mi(`\sum_x \pi_x = 1`)，那么 $pi$ 是随机游走的平稳分布。

*证明*：#mi(`\pi_x p_{xy} = \pi_y p_{yx}`)，两边求和，#mi(`\pi_x = \sum_y \pi_y p_{yx}`)，因此 \(\pi\) 满足 #mi(`\pi = \pi P`)。(By Theorem 1.3.2 ...)

== 无向图上随机游走的收敛性

下一个问题：游走需要多长时间开始反映Markov过程的平稳概率？

*示例*：这需要很长时间才能收敛。游走很难通过图的两个部分之间的窄通道。

#figure(
  image("img/6.png", width: 50%),
  caption: []
)

我们在下面定义了Markov链的收缩的一个组合度量，称为归一化导通率。


*定义 1.3.1* 设 #mi(`\varepsilon > 0`)。Markov链的 #mi(`\(\varepsilon\)-mixing`)时间是最小的整数 #mi(`t`)，使得对于任何初始分布 #mi(`P_0`)，第 #mi(`t`) 步的平均概率分布与平稳分布之间的1-范数距离最多为 #mi(`\varepsilon`)。

#mitex(`|a_t - \pi| \leq \varepsilon`)


*定义 1.3.2* 对于一个顶点子集 #mi(`S`)，令 #mi(`\pi(S)`) 表示 #mi(`\sum_{x \in S} \pi_x`)。归一化导通率定义为：

#mitex(`\Phi(S) = \frac{\sum_{(x, y) \in (S, \bar{S})} \pi_x p_{xy}}{\min(\pi(S), \pi(\bar{S}))}`)

其中，#mi(`\bar{S} = V - S`) 。#mi(`\pi(S)`) 是平稳分布下，Markov链处于某状态属于 #mi(`S`) 的概率。


*定义 1.3.3* Markov链的归一化导通率，记作 #mi(`\Phi`) ，定义为：

#mitex(`\Phi = \min_S \Phi(S)`)

*定理 1.3.4*. 在无向图上，随机游走的 #mi(`\(\varepsilon\)-mixing`)时间为：

#mitex(`\Phi \left( \frac{\ln \left( \frac{1}{\pi_{\text{min}}} \right)}{\Phi^2 \varepsilon^3} \right)
`)

其中，#mi(`\pi_{\min}`) 是任何状态的最小平稳概率。

使用归一化导通率证明收敛性。

接下来，我们应用定理 1.3.4 通过一些例子说明归一化导通率如何限制收敛速度。



① *一个一维的格子*

#figure(
  image("img/7.png", width: 50%),
  caption: []
)

n个顶点路径，两端都有自环。

平稳概率在所有顶点上是均匀的 #mi(`\frac{1}{n}`)。

具有最小归一化导通率的集合是：
  - 具有 #mi(`\pi \leq \frac{1}{2}`) 的集合；
  - 包含前 #mi(`\frac{n}{2}`) 个顶点的集合。

从集合 #mi(`S`) 到集合 #mi(`\bar{S}`) 的边的总导通率是：

#mi(`\pi_m p_{m, m+1} = \Omega \left( \frac{1}{n} \right), (m = \frac{n}{2})`)

#mi(`\pi(S) = \frac{1}{2}`)

因此，#mi(`\Phi(\bar{S}) = 2\pi_m p_{m, m+1} = \Omega \left( \frac{1}{n} \right)`)

根据定理 1.3.4，对于 #mi(`\varepsilon = \frac{1}{100}`)，经过 #mi(`O(n^2 \log n)`) 步之后，#mi(`||a_t - \pi|| \leq \frac{1}{100}`)。

此图没有快速收敛性。



== 4. 单位边权重的无向图上的随机游走

我们使用这种特殊类型的图来回答以下问题：

- 随机游走从 #mi(`x`) 到达 #mi(`y`) 的期望时间是多少？
- 从 #mi(`x`) 到 #mi(`y`) 并返回的期望时间是多少？
- 到达每个顶点的期望时间是多少？

#linebreak()
#linebreak()

#align(center)[#commutative-diagram(
  node((0, 0), $X$),
  node((0, 2), $Y$),
  // node((1, 0), $X \/ "ker"(f)$, "quot"),
  arr($X$, $Y$, "random walk",curve: 30deg),
  // arr("quot", (0, 1), $tilde(f)$, label-pos: right, "dashed", "inj"),
  // arr($X$, "quot", $pi$),
)]

① *命中时间*

#mi(`h_{xy}`) —— 也称为发现时间。

*引理 1.3.5*. 从路径上的一个端点开始随机游走，穿过有n个顶点的路径到达另一端的期望时间是 #mi(`\Theta H(n^2)`)。

*证明*：

#align(center)[#mi(`h_{12} = 1`)

#mi(`h_{i, i+1} = \frac{1}{2} + \frac{1}{2}(1 + h_{i-1, i+1})`)

#mi(`= 1 + \frac{1}{2}(h_{i-1, i} + h_{i, i+1})`)

#mi(`= 2 + h_{i-1, i}`)

因此，#mi(`h_{i, i+1} = 2i - 1`) ，#mi(`2 \leq i \leq n-1`)

要从1走到n，

#mi(`h_{1, n} = \sum_{i=1}^{n-1} h_{i, i+1}`)

#mi(`= \sum_{i=1}^{n-1} (2i - 1)`)

#mi(`= 2 \sum_{i=1}^{n-1} i - \sum_{i=1}^{n-1} 1`)

#mi(`= 2 \frac{n(n-1)}{2} - (n-1)`)

#mi(`= (n-1)^2`)]

#figure(
  image("img/9.png", width: 40%),
  caption: []
)



*引理 1.3.6* 设随机游走从顶点1到顶点n，在包含n个顶点的链中。令 #mi(`t(i)`) 为在顶点 #mi(`i`) 停留的期望时间。那么：

#mitex(`
t(i) = 
\begin{cases} 
n-1, & i=1 \\
2(n-i), & 2 \leq i \leq n-1 \\
1, & i = n
\end{cases}
`)

*证明* 现在 #mi(`t(n) = 1`)，因为游走到达n时会停止。当游走到达 #mi(`n-1`) 时，一半的时间它会继续走向n。因此，#mi(`t(n-1) = 2`)。对于 #mi(`3 \leq i \leq n-1`)，

#align(center)[#block(align(left)[#mi(`
t(i) = \frac{1}{2} [t(i-1) + t(i+1)]
`)

#mi(`
t(1) = \frac{1}{2} t(2) + 1
`)

#mi(`
t(2) = t(1) + \frac{1}{2} t(3)
`)])]

因此我们得到

#mi(`
t(i+1) = 2t(i) - t(i-1)
`)

因此，#mi(`t(i) = 2(n-i)`) 对于 #mi(`3 \leq i \leq n-1`)。

#mi(`t(2) = 2(n-2)`)，#mi(`t(1) = n-1`)。

因此，在顶点停留的总时间是

#mitex(`
n-1 + 2(1 + 2 + ... + n-2) + 1 = (n-1 + 1 + 2 \frac{(n-1)(n-2)}{2} + 1) = (n-1)^2 + 1
`)

这比 #mi(`h_{1n}`) 多出1。



② *往返时间*

#mitex(`commute(x, y) = h_{xy} + h_{yx}`)



③ *覆盖时间*

#mi(`Cover(x, G) \rightarrow`) 从顶点 #mi(`x`) 开始的随机游走到达每个顶点至少一次的期望时间。

#mitex(`Cover(G) = \max_x Cover(x, G)`)



*定理 1.3.7*. 设 #mi(`G`) 是一个有 #mi(`n`) 个顶点和 #mi(`m`) 条边的图。覆盖时间 #mi(`Cover(G)`) 的上界为 #mi(`4m(n-1)`)。

*证明*. 进行一次从某个顶点 #mi(`Z`) 开始的深度优先搜索。#mi(`T`) 是结果生成的深度优先搜索生成树。深度优先搜索覆盖每个顶点。注意，生成树中的每条边在两个方向上都被遍历了两次。

#mitex(`
Cover(Z, G) \leq \sum_{(x, y) \in T, (y, x) \in T} h_{xy}
`)



*推论*. 如果 #mi(`x`) 和 #mi(`y`) 是相邻的，则 #mi(`h_{xy} + h_{yx} \leq 2m`)，其中 #mi(`m`) 是边的数量。  
该推论表明 #mi(`h_{xy} \leq 2m`)。  
由于深度优先搜索树中有 #mi(`n-1`) 条边，并且每条边都被遍历两次，#mi(`Cover(Z) \leq 4m(n-1)`)。  
因此，#mi(`Cover(G) \leq 4m(n-1)`)。



== 更多关于 Markov 的内容



*△ 一个简单的 Markov 链* #mi(`\langle S, P \rangle`) #mi(`S`): 状态, #mi(`P`): 概率

#figure(
  image("img/12.png", width: 80%),
  caption: []
)



#align(center)[#block({
align(left)[
大量路径的例子：

 #mi(`C_1, C_2, C_3, pass`)

 #mi(`C_1, TikTok, C_1, C_2, C_3, pass`)

 #mi(`C_1, C_2, C_3, Library, C_2, pass`)

 ......]
})]



*△ Markov 奖励过程* #mi(`\langle S, P, R, \gamma \rangle`) #mi(`R`): 奖励, #mi(`\gamma`): 折扣因子

#figure(
  image("img/13.png", width: 80%),
  caption: []
)

 总奖励

#mi(`G_t = R_{t+1} + \gamma R_{t+2} + \gamma^2 R_{t+3} + \cdots`)

#mi(`= \sum_{k=0}^{\infty} \gamma^k R_{t+k+1}`)



 状态的价值函数

#mi(`V(s) = \mathbb{E}[G_t \mid S_t = s]`)

\= 从该状态开始的期望奖励，即不同路径的平均奖励。



*路径*：#mi(`C_1, C_2, C_3, Pass, Exit`)

#mi(`S_1 = C_1`) 且 #mi(`\gamma = 1/2`)

#mi(`
V_{C_1} = -2 - 2 \cdot \frac{1}{2} - 2 \cdot \frac{1}{4} - 10 \cdot \frac{1}{8} = -2.25
`)



*路径*：#mi(`C_1, TikTok, TikTok, C_1, C_2, Exit`)

#mi(`
V_{C_1} = -2 - 1 \cdot \frac{1}{2} - 1 \cdot \frac{1}{4} - 2 \cdot \frac{1}{8} - 2 \cdot \frac{1}{16} = -3.125
`)

#figure(
  image("img/14.png", width: 80%),
  caption: []
)

#figure(
  image("img/15.png", width: 80%),
  caption: []
)

*Bellman 期望方程*

#mitex(`
\begin{align*}
    V(s) &= \mathbb{E} \left[ G_t \mid s_t = s \right] \\
         &= \mathbb{E} \left[ R_{t+1} + \gamma R_{t+2} + \gamma^2 R_{t+3} + \cdots \mid s_t = s \right] \\
         &= \mathbb{E} \left[ R_{t+1} + \gamma \left( R_{t+2} + \gamma R_{t+3} \cdots \right) \mid s_t = s \right] \\
         &= \mathbb{E} \left[ R_{t+1} + \gamma G_{t+1} \mid s_t = s \right] \\
         &= \mathbb{E} \left[ R_{t+1} + \gamma V(s_{t+1}) \mid s_t = s \right]
\end{align*}
`)

// #mitex(`
// V(s) = \mathbb{E}[G_t \mid S_t = s]
// `)

// #mitex(`
// = \mathbb{E}[R_{t+1} + \gamma R_{t+2} + \gamma^2 R_{t+3} + \cdots \mid S_t = s]
// `)

// #mitex(`
// = \mathbb{E}[R_{t+1} + \gamma (R_{t+2} + \gamma R_{t+3} + \cdots) \mid S_t = s]
// `)

// #mitex(`
// = \mathbb{E}[R_{t+1} + \gamma G_{t+1} \mid S_t = s]
// `)

// #mitex(`
// = \mathbb{E}[R_{t+1} + \gamma V(S_{t+1}) \mid S_t = s]
// `)



使用 #mi(`s'`) 表示 #mi(`t+1`) 的可能状态，

#mitex(`
V(s) = R_s + \gamma \sum_{s' \in S} P_{ss'} V(s')
`)



对于 class 3

#mitex(`4.3 = -2 + 0.6 \times 10 + 0.4 \times 0.8`)

*△ Markov 决策过程* #mi(`\langle S, A, P, R, \gamma \rangle`)  
#mi(`A: 动作`)

#figure(
  image("img/16.png", width: 80%),
  caption: []
)

*策略*：采取动作的概率分布。

#mitex(`\pi(a \mid s) = \mathbb{P}[A_t = a \mid S_t = s]`)



给定一个 MDP #mi(`M = \langle S, A, P, R, \gamma \rangle`) 和一个策略 #mi(`\pi`)。  
序列 #mi(`S_1, S_2, \cdots`) 是一个 Markov 过程 #mi(`\langle S, p^\pi \rangle`)。

状态和奖励序列 #mi(`S_1, R_2, S_2, \cdots`) 是一个 Markov 过程 #mi(`\langle S, P^\pi, R^\pi, \gamma \rangle`)。



在策略 #mi(`\pi`) 下，从状态 #mi(`s`) 转移到 #mi(`s'`) 的概率是：

#mitex(`P^\pi_{ss'} = \sum_{a \in A} \pi(a \mid s) P^a_{ss'}`)



在策略 #mi(`\pi`) 下，状态 #mi(`s`) 的奖励是：

#mitex(`R^\pi_s = \sum_{a \in A} \pi(a \mid s) R^a_s`)



*价值函数*：

#mitex(`V_\pi(s) = \mathbb{E}_\pi [G_t \mid S_t = s]`)



*策略价值函数*：

#mitex(`q_\pi(s, a) = \mathbb{E}_\pi [G_t \mid S_t = s, A_t = a]`)



*Bellman 方程*：


#mitex(`
\begin{align*}
    V_{\pi}(s) &= \mathbb{E}_{\pi} \left[ R_{t+1} + \gamma v_{\pi} \left( s_{t+1} \right) \mid s_t = s \right] \\
    q_{\pi}(s, a) &= \mathbb{E}_{\pi} \left[ R_{t+1} + \gamma q_{\pi} \left( s_{t+1}, A_{t+1} \right) \mid s_t = s, A_t = a \right] \\
    因此 \quad V_{\pi}(s) &= \sum_{a \in \mathcal{A}} \pi(a \mid s) q_{\pi}(s, a)
\end{align*}
`)

// #mitex(`
// V_\pi(s) = \mathbb{E}_\pi [R_{t+1} + \gamma V_\pi(s_{t+1}) \mid s_t = s]
// `)

// #mitex(`
// q_\pi(s, a) = \mathbb{E}_\pi [R_{t+1} + \gamma q_\pi(s_{t+1}, A_{t+1}) \mid s_t = s, A_t = a]
// `)

// 因此，

// #mitex(`
// V_\pi(s) = \sum_{a \in A} \pi(a \mid s) q_\pi(s, a)
// `)



且 #mi(`
q_\pi(s) = R^a_s + \gamma \sum_{s' \in S} P^a_{ss'} V_\pi(s')
`)



因此，

#mitex(`
q_\pi(s) = R^a_s + \gamma \sum_{s' \in S} P^a_{ss'} \sum_{a' \in A} \pi(a' \mid s') q_\pi(s', a')
`)



*最优价值函数*

#mitex(`
V_*(s) = \max_\pi V_\pi(s)
`)



*最优动作-价值函数*

#mitex(`
q_*(s, a) = \max_\pi q_\pi(s, a)
`)



我们可以使用 #mi(`q_*(s, a)`) 来得到最优策略 #mi(`\pi`)：

#mitex(`
\pi_*(a \mid s) = 
\begin{cases}
1 & \text{if } a = \arg\max_{a \in A} q_*(s, a) \\
0 & \text{otherwise}
\end{cases}
`)

