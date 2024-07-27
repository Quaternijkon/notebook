#import "../../../lib.typ":*

=== #Title(
  title: [丑数],
  reflink: "https://leetcode.cn/problems/ugly-number-ii/description/",
  level: 2,
)<丑数>

#note(
  title: [
丑数
  ],

  description: [
给你一个整数 n ，请你找出并返回第 n 个 丑数 。

说明：丑数是只包含质因数 2、3 和/或 5 的正整数；1 是丑数。
  ],

  examples: ([
输入: n = 10

输出: 12

解释: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 是前 10 个丑数。    
    ],
  ),

  tips: [
1 <= n <= 1690
  ],

  solutions: (
  ( name:[动态规划],
    text:[
根据题意，每个丑数都可以由其他较小的丑数通过乘以 2 或 3 或 5 得到。

所以，可以考虑使用一个优先队列保存所有的丑数，每次取出最小的那个，然后乘以 2 , 3 , 5 后放回队列。然而，这样做会出现重复的丑数。例如：

> 初始化丑数列表 $[1]$

> 第一轮： 1 -> 2, 3, 5 ，丑数列表变为 $[1, 2, 3, 5]$

> 第二轮： 2 -> 4, 6, 10 ，丑数列表变为 $[1, 2, 3, 4, 6, 10]$

> 第三轮： 3 -> 6, 9, 15 ，出现重复的丑数 $6$

为了避免重复，我们可以用三个指针 a , b, c ，分别表示下一个丑数是当前指针指向的丑数乘以 2 , 3 , 5 。

利用三个指针生成丑数的算法流程：
1. 初始化丑数列表 res ，首个丑数为 1 ，三个指针 a , b, c 都指向首个丑数。
2. 开启循环生成丑数：
	1. 计算下一个丑数的候选集 $"res"[a] dot 2 , "res"[b] dot 3,"res"[c] dot 5$ 。
	2. 选择丑数候选集中最小的那个作为下一个丑数，填入 res 。
	3. 将被选中的丑数对应的指针向右移动一格。
3. 返回 res 的最后一个元素即可。
  ],code:[
```cpp
class Solution {
public:
    int nthUglyNumber(int n) {
        int a = 0, b = 0, c = 0;
        int res[n];
        res[0] = 1;
        for(int i = 1; i < n; i++) {
            int n2 = res[a] * 2, n3 = res[b] * 3, n5 = res[c] * 5;
            res[i] = min(min(n2, n3), n5);
            if (res[i] == n2) a++;
            if (res[i] == n3) b++;
            if (res[i] == n5) c++;
        }
        return res[n - 1];
    }
};
```      
  ]),

  ),

  gain:none,
)