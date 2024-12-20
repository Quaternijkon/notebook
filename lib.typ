#import "@preview/codly:1.0.0": *
#import "@preview/gentle-clues:0.9.0": *
#import "@preview/cuti:0.2.1": show-cn-fakebold
#import "@preview/showybox:2.0.1": showybox
#import "@preview/cetz:0.2.2"
#import "@preview/mitex:0.2.4":*
#import "@preview/lovelace:0.3.0": *
#import "@preview/finite:0.3.2":automaton
#import "@preview/commute:0.2.0":*
#import "../Draft/src/exports.typ":*


#let (
  BLUE,
  GREEN,
  YELLOW,
  RED,
)=(
  rgb("#4285f4"),
  rgb("#34a853"),
  rgb("#fbbc05"),
  rgb("#ea4335"),
)

#let BlueText(_text)={
  set text(fill: BLUE)
  [#_text]
}

#let GreenText(_text)={
  set text(fill: GREEN)
  [#_text]
}

#let YellowText(_text)={
  set text(fill: YELLOW)
  [#_text]
}

#let RedText(_text)={
  set text(fill: RED)
  [#_text]
}

#import "@preview/suiji:0.3.0": *

#let Colorful(_text)={
  let colors = (
     rgb("#4285F4"),
     rgb("#34A853"),
     rgb("#FBBC05"),
     rgb("#EA4335"),
  )

  let i=7;
  let rng = gen-rng(_text.text.len() * i);
  let index_pre = integers(rng, low: 0, high: 4, size: none, endpoint: false).at(1);


  for c in _text.text{
    let rng = gen-rng(i - 1);
    let index_cur = integers(rng, low: 0, high: 4, size: none, endpoint: false).at(1);
    let cnt=100;
    while index_cur == index_pre and cnt>0{
      let rng = gen-rng(cnt + i);
      index_cur = integers(rng, low: 0, high: 4, size: none, endpoint: false).at(1);
      cnt -= 1;
    }
    let color = colors.at(index_cur);
    set text(fill: color)
    [#c]
    index_pre = index_cur;
    i += 2;

  }
}

// #let Link(_link)=box(link(_link,image("assets/link.svg")), height: 1em)

#let Title(
    title:[],
    reflink:"",
    level:1,
  )={
  let pic = (
    "",
    "assets/easy.svg",
    "assets/medium.svg",
    "assets/hard.svg",
  )
  box(
    image(pic.at(level), height: 1em),
  )
  [#title]
  box(
    link(reflink,image("assets/link.svg", height: 1em))
  )
}

#let note(
  difficuty:[],
  title:[标题],
  description:[描述],
  examples:(),
  tips:[提示],
  solutions:(),
  code:[代码],
  gain:none,
)={
  
  block({
    question(
      title:title,
    )[#description]
    
    let i=1;
    
    for _example in examples {
      example(
        title:"示例" + str(i),
      )[#_example]
      i+=1;
    }

    tip(
      title:[提示],
    )[#tips]

    let j=1;

    // pagebreak()

    for solution in solutions {
      idea(
        title:"方法" + str(j)+":    "+solution.name,
      )[#solution.text

      #solution.code
      ]

      j+=1;
    }
    
    if(gain != none){
      conclusion(
        title:[笔记],
      )[#gain]
    }
    
  })
}

#let xquotation(first:[],second:[])=if first != [

]{ quotation(
    title:[书内链接],
  )[
    #columns(2)[
    #set par(justify: true)
    #first
    #colbreak()
    #second
  ]
  ]
}

//
  // #llltable(
  //   titles:table.header(
  //     [*Random walk*],[*Markov chain*]
  //   ),
  //   columns:2,
  //   caption: [随机游走与马尔可夫链],
  //   [图 Graph], [随机过程 Stochastic process],[顶点 Vertex], [状态 State],[强连通 Strongly connected], [持续 Persistent],[非周期的 Aperiodic], [非周期的 Aperiodic],[强连通且非周期的 Strongly connected and aperiodic], [遍历的 Ergodic],[无向图 Undirected graph], [时间可逆的 Time reversible]
    
  // )
yes! it works!
#let llltable(titles:[],columns:1,caption:[],align:left,kind:"table",supplement:[表],..items)={
  let items=items.pos()//在函数定义中，..bodies 表示接收任意数量的参数，这些参数被收集到一个特殊的 参数对象（arguments object） 中.bodies.pos() 方法从参数对象中提取所有的 位置参数，并返回一个 序列（sequence），即一个有序的参数列表。
  figure(
    kind:kind,
    supplement:supplement,
    caption: caption,
    table(
    stroke: none, 
    columns: columns,
    align: align,
    table.hline(),
    // table.header(
    //   for title in titles {
    //     strong(title)
    //   }
    // ),
    titles,
    table.hline(),
    ..items,
    table.hline(),
    ),
  )
}

#let algo(caption:[],content:[])={
  figure(
    kind: "algorithm",
    caption: caption,
    supplement: [算法],
    content
  )
}

