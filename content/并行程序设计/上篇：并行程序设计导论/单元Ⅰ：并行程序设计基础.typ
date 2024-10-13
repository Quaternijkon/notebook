#import "../../../lib.typ": *

== 并行程序设计基础

=== 并行计算机系统与结构模型

=== PC机群的搭建

=== 并行程序设计简介

=== 并行编译简介

==== 数据依赖关系

#showybox(title: [Def1])[
/ $S #sym.delta^f T$ :若x #sym.in OUT（S）且 x#sym.in IN（T）且T使用S计算出的x的值，T流依赖于S;
/ $S #sym.delta^a T$ :若x #sym.in IN（S）且 x#sym.in OUT（T）但S使用x值先于T对x的定值；T反依赖于S；
/ $S #sym.delta^o T$ :若x #sym.in OUT（S）且 x#sym.in OUT（T）但S较之T先对x进行定值；T输出依赖于S；
]

==== 依赖距离和依赖向量

令 $alpha = (alpha_1, alpha_2, dots, \)$ 和 $beta = (beta_1, beta_2, dots, beta_n)$ 是 n 层循环内的 n 个整数下标向量，假定 $alpha$ 和 $beta$ 存在数据相关性，则依赖距离向量（Dependent Distance Vector）$D = (D_1, D_2, dots, D_n)$ 定义为 $beta - alpha$；

而依赖方向向量（Dependent Direction Vector）$d = (d_1, d_2, dots, d_n)$ 定义为：

$ d_i = cases(
    ＜（1） space space space space space alpha_i ＜ beta_i ,
    =（0） space space space space space alpha_i = beta_i ,
    ＞（-1） space space alpha_i ＞ beta_i 
) $


例如，有如下的三层循环嵌套:

```plaintext
for i = l₁ to u₁ do
    for j = l₂ to u₂ do
        for k = l₃ to u₃ do
            A(i + 1, j, k - 1) = A(i, j, k) + C
```

则数组 $A$ 的三维迭代之间的相关距离向量: $D = (i + 1 - i, j - j, k - 1 - k) = (1, 0, -1)$

和相关方向向量: $= (<, =, >)$

==== 语句依赖图和迭代依赖图


