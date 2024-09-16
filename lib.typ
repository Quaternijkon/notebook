#import "@preview/codly:1.0.0": *
#import "@preview/gentle-clues:0.9.0": *
#import "@preview/cuti:0.2.1": show-cn-fakebold
#import "@preview/showybox:2.0.1": showybox


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
