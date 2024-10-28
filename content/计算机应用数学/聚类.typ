#import "../../lib.typ": *

#set math.equation(numbering: none)

= 聚类

#side-by-side[
监督学习
#image("img/3-1-1.png")
数据-有标签

需要训练/测试数据

分类

将可以区分 x 和 o 的分类器。

其他类型：强化学习等
][
无监督学习
#image("img/3-1-2.png")
数据-无标签

---

聚类

将相似的数据点放入同一组。

PARTI. 聚类.
]


聚类：将一组对象分成多个簇，或者简单地找到一些簇。

簇：一个对象的组，使得组内的对象之间的相似度比组外的更高（在某种意义上）。

#mi(`n`)：数据点的数量。 #mi(`K`)：所需簇的数量。

#mi(`A = \{a_1, \cdots , a_n\}`)  #mi(`n`) 个数据点，#mi(`a_i`) - 行向量

#mi(`a_i \in \mathbb{R}^d`)（有时我们假设 #mi(`a_i \in \{0, 1\}^d`))

1. 基于中心的聚类

每个簇表示为一个中心向量，它不一定是数据集的成员。

#image("img/3-3.png", width: 30%)

示例：K-均值 / K-中值 / K-中心。 


2. 谱聚类

将数据投影到新的空间中并运行 K-均值……

#image("img/3-4.png", width: 30%)

在整个空间及其投影中的簇。

3. 基于密度的聚类

#image("img/3-5.png", width: 30%)


簇被定义为比数据集其余部分密度更高的区域。

4. 层次聚类

不需要指定 #mi(`K`)。

每个层次级别的簇是通过合并下一个较低层级的簇来创建的。

预备知识：对象之间的距离。

假设数据点来自 #mi(`M \subseteq \mathbb{R}^d`) 或 #mi(`M \subseteq \{0, 1\}^d`)。



度量。

#mi(`D: M \times M \rightarrow \mathbb{R}`)，如果对于所有 #mi(`x, y, z \in M`)，则

1. #mi(`D(x, y) = 0 \iff x = y`)
2. #mi(`D(x, y) = D(y, x)`)
3. #mi(`D(x, z) \leq D(x, y) + D(y, z)`) – 三角不等式

注意 #mi(`D(x, y) \geq 0`)

证明：#mi(`D(x, y) + D(y, x) \geq D(x, x)`)，

这得出 #mi(`2D(x, y) \geq D(x, x) \geq 0`)，因此 #mi(`D(x, y) \geq 0`)

我们也称 #mi(`D`) 为距离函数。

例子：#mi(`D_{l_2}(x, y) = ||x - y||_2 = \left( \sum_{i=1}^d |x_i - y_i|^2 \right)^{1/2}`)

欧几里得距离

翻译如下：

---

#mi(`D_{l_1}(x, y) = \sum_{i=1}^d |x_i - y_i|`)

曼哈顿距离

#mi(`D_{l_p}(x, y) = ||x - y||_p = \left( \sum_{i=1}^d |x_i - y_i|^p \right)^{1/p}`)

#mi(`p \geq 1`)。闵可夫斯基距离，#mi(`l_p`) 范数。

欧几里得距离和曼哈顿距离的广义版本。


== 基于中心的聚类

=== K-中值 / K-均值 / K-中心定义

I. K-中值：给定 #mi(`A \subseteq M, K \geq 1`)，找到 #mi(`C = \{C_1, \cdots , C_K\} \subseteq M`) 以使

#mitex(`\sum_{a \in A} \min_{1 \leq i \leq K} D(a, C_i)`)

最小化，其中 #mi(`C_i`)称为中心。

- 给定 #mi(`C = \{C_1, \cdots , C_K\}`)，定义

  #mi(`C_i = \{a \in A | \forall j, D(a, C_i) \leq D(a, C_j)\}`)

- 如果有平局，则 #mi(`C = \{C_1, \cdots , C_K\}`) 是 #mi(`A`) 的一个划分。因此等价地，我们最小化

  #mitex(`\sum_{j=1}^K \sum_{a \in C_j} D(a, C_j)`)


一些符号说明：

1. 如果 #mi(`C \subseteq M`)，#mi(`|C| < \infty`)，则 #mi(`D(x, C) := \min_{c \in C} D(x, c)`)

2. 如果 #mi(`A, C \subseteq M`)，#mi(`|A|, |C| < \infty`)，则 #mi(`D(A, C) := \sum_{a \in A} D(a, C)`)

   称为相对于 #mi(`C`) 的 #mi(`A`) 的 (D-) 成本。

3. 如果 #mi(`K \in \mathbb{N}`)，#mi(`cost_K^D(A) := \min_{C \subseteq M, |C|=K} D(A, C)`)

   称为 #mi(`A`) 的 K-均值成本。


因此，K-中值问题如下：

给定 #mi(`A \subseteq M, K \subseteq M`)，找到 #mi(`C = \{C_1, \cdots , C_K\} \subseteq M`)，使得 #mi(`D(A, C) = cost_K^D(A)`)

对于 K-均值，我们使用曼哈顿距离。

对于 K-中心，我们使用曼哈顿距离。




