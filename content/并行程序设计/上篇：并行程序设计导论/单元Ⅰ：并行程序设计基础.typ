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

#showybox(title: [Def2])[

]

